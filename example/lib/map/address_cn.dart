import 'package:amap_map_fluttify_example/utils/misc.dart';
import 'package:amap_map_fluttify_example/utils/next_latlng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

List<String> _tabs = [
  '全部',
  '小区',
  '生活服务',
  '休闲娱乐',
];

class AddressCN extends StatefulWidget {
  AddressCN({Key key}) : super(key: key);

  @override
  _AddressCNState createState() => _AddressCNState();
}

class _AddressCNState extends State<AddressCN> with NextLatLng {
  AmapController _controller;
  Location _location;
  List<Poi> _pois;
  Poi _selected;
  bool _loading = true;

  // 是否用户手势移动地图
  bool _moveByUser = false;

  String _tab = _tabs[0];

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  Future _init() async {
    if (await requestPermission()) _location = await AmapLocation.instance.fetchLocation();

    await _getPOIs(_location.latLng);
  }

  Future _getPOIs(LatLng latlng) async {
    setState(() => _loading = true);

    String keyword = _tab == _tabs[0] ? '' : _tab;

    _pois = await AmapSearch.instance.searchAround(latlng, keyword: keyword, type: '', pageSize: 40, radius: 5000);

    if (_pois != null && _pois.length > 0) _selected = _pois[0];

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('地址选择')),
      body: _pois == null
          ? Center(child: Text('加载中...'))
          : Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      AmapView(
                        mapType: MapType.Standard,
                        showZoomControl: false,
                        tilt: 90,
                        zoomLevel: 19,
                        showCompass: true,
                        centerCoordinate: _selected == null ? _location.latLng : _selected.latLng,
                        maskDelay: Duration(milliseconds: 500),
                        onMapCreated: (controller) async {
                          _controller = controller;
                          await _controller?.showMyLocation(MyLocationOption(myLocationType: MyLocationType.Show));
                        },
                        onMapMoveEnd: (move) async {
                          if (_moveByUser) {
                            setState(() => _tab = _tabs[0]);
                            _getPOIs(move.latLng);
                          }
                          _moveByUser = true;
                        },
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Icon(Icons.location_pin, color: Colors.red, size: 36),
                        ),
                      ),
                      Positioned(right: 10, bottom: 5, child: _locationButton()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: _renderPOIs(),
                ),
              ],
            ),
    );
  }

  Widget _locationButton() {
    Widget current = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300], width: 0.5),
      ),
      padding: EdgeInsets.all(5),
      child: Icon(Icons.my_location_outlined, color: Colors.grey[600], size: 18),
    );

    current = GestureDetector(
      onTap: () async {
        setState(() {
          _tab = _tabs[0];
        });
        await _getPOIs(_location.latLng);
        await _controller.setCenterCoordinate(_selected.latLng);
        _moveByUser = false;
      },
      child: current,
    );

    return current;
  }

  Widget _renderPOIs() {
    Widget current = Column(
      children: [
        _renderSearch(),
        _renderTabs(),
        Expanded(
          child: _loading
              ? Center(child: CupertinoActivityIndicator(radius: 16))
              : ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: _pois.map((e) => _renderPOI(e)).toList(),
                ),
        ),
        _renderOKButton(),
      ],
    );

    return current;
  }

  Widget _renderPOI(Poi poi) {
    Widget title = Text(poi.title, style: TextStyle(color: Colors.black, fontSize: 15));

    String addr = poi.provinceName + poi.cityName + poi.adName + poi.address;
    Widget address = Text(addr, style: TextStyle(color: Colors.grey[600], fontSize: 13));

    Widget current = Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: Icon(Icons.location_pin, color: Colors.grey[400], size: 18),
                  ),
                  Expanded(child: title),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: Icon(Icons.location_pin, color: Colors.transparent, size: 18),
                  ),
                  Expanded(child: address),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(Icons.done, color: _selected.poiId == poi.poiId ? Colors.blue : Colors.transparent),
        ),
      ],
    );
    current = Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: current,
    );

    current = GestureDetector(
        onTap: () async {
          _selected = poi;
          await _controller.setCenterCoordinate(_selected.latLng);
          _moveByUser = false;
          setState(() {});
        },
        child: current);

    return current;
  }

  Widget _renderSearch() {
    Widget current = Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(padding: EdgeInsets.only(top: 2), child: Icon(Icons.search, size: 18, color: Colors.grey[500])),
          Text('搜索地点', style: TextStyle(color: Colors.grey[500])),
        ],
      ),
    );

    return current;
  }

  Widget _renderTabs() {
    List<Widget> children = _tabs.map((e) {
      Widget txt = Text(e, style: TextStyle(color: _tab == e ? Colors.blue : Colors.black));

      txt = GestureDetector(
        onTap: () async {
          _tab = e;
          await _getPOIs(_selected.latLng);
          _controller.setCenterCoordinate(_selected.latLng);
          _moveByUser = false;
        },
        child: txt,
      );

      return txt;
    }).toList();

    Widget current = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );

    current = Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: current);

    return current;
  }

  Widget _renderOKButton() {
    Widget current = Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(999.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Text('确认选点', style: TextStyle(color: Colors.white, fontSize: 16)),
    );

    current = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300], width: 0.5)),
      ),
      child: current,
    );

    return current;
  }
}
