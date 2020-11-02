import 'address_search.dart';
import 'package:amap_map_fluttify_example/utils/misc.dart';
import 'package:amap_map_fluttify_example/utils/next_latlng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'poi_item.dart';

List<String> _tabs = [
  '全部',
  '小区',
  '生活服务',
  '休闲娱乐',
];

class AddressMap extends StatefulWidget {
  AddressMap({Key key}) : super(key: key);

  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> with NextLatLng {
  AmapController _controller;
  Location _myLocation;
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
    if (await requestPermission()) _myLocation = await AmapLocation.instance.fetchLocation();

    await _getPOIs(_myLocation.latLng);
  }

  Future _getPOIs(LatLng latlng, {bool reset = true}) async {
    setState(() => _loading = true);

    String keyword = _tab == _tabs[0] ? '' : _tab;

    _pois = await AmapSearch.instance.searchAround(latlng, keyword: keyword, type: '', pageSize: 40, radius: 5000);

    if (_pois != null && _pois.length > 0 && reset) _selected = _pois[0];

    setState(() => _loading = false);
  }

  Future _setCenterCoordinate(LatLng latLng, {bool reset = true}) async {
    await _getPOIs(latLng, reset: reset);
    await _controller.setCenterCoordinate(_selected.latLng);
    _moveByUser = false;
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
                        centerCoordinate: _selected == null ? _myLocation.latLng : _selected.latLng,
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
                            child: Icon(Icons.location_pin, color: Colors.red, size: 36)),
                      ),
                      Positioned(right: 10, bottom: 5, child: _myLocationButton()),
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

  Widget _myLocationButton() {
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
        setState(() => _tab = _tabs[0]);
        await _setCenterCoordinate(_myLocation.latLng);
      },
      child: current,
    );

    return current;
  }

  Widget _renderPOIs() {
    List<Widget> children = _pois
        .map((e) => POIItem(
              poi: e,
              selected: e.poiId == _selected.poiId,
              onClick: () async {
                _selected = e;
                await _controller.setCenterCoordinate(_selected.latLng);
                _moveByUser = false;
                setState(() {});
              },
            ))
        .toList();
    Widget current = Column(
      children: [
        _Search(callback: (v) async {
          _tab = _tabs[0];
          _setCenterCoordinate(v.latLng);
        }),
        _Tabs(
          selected: _tab,
          onClick: (selected) async {
            _tab = selected;
            await _setCenterCoordinate(_selected.latLng, reset: false);
          },
        ),
        Expanded(
          child: _loading
              ? Center(child: CupertinoActivityIndicator(radius: 16))
              : ListView(padding: EdgeInsets.symmetric(horizontal: 10), children: children),
        ),
        _loading ? Container() : _renderOKButton(),
      ],
    );

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

class _Search extends StatelessWidget {
  final Function(Poi poi) callback;

  const _Search({Key key, @required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(width: 5),
          Text('搜索地点', style: TextStyle(color: Colors.grey[500])),
        ],
      ),
    );

    current = GestureDetector(
        onTap: () async {
          var ret = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddressSearch()));
          if (ret == null) return;

          this.callback(ret);
        },
        child: current);

    return current;
  }
}

class _Tabs extends StatelessWidget {
  final String selected;

  final Function(String selected) onClick;

  const _Tabs({Key key, @required this.selected, @required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = _tabs.map((e) {
      Widget txt = Text(e, style: TextStyle(color: selected == e ? Colors.blue : Colors.black));

      txt = GestureDetector(
        onTap: () => this.onClick(e),
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
}
