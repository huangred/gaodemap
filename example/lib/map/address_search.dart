import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddressSearch extends StatefulWidget {
  AddressSearch({Key key}) : super(key: key);

  @override
  _AddressSearchState createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController _txtController;
  bool _showClear = false;

  @override
  void dispose() {
    _txtController?.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _txtController = TextEditingController();
    _txtController.addListener(() {
      if (_showClear) return;
      _showClear = _txtController.text.length > 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('搜索地点'),
      ),
      body: Column(
        children: [
          _renderSearch(),
          Divider(height: 1.0),
        ],
      ),
    );
  }

  Widget _renderSearch() {
    Widget current = Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(padding: EdgeInsets.only(top: 2), child: Icon(Icons.search, size: 18, color: Colors.grey[500])),
          SizedBox(width: 5),
          Expanded(child: _renderInput()),
          _showClearIcon(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.only(top: 1),
            child: SizedBox(
              width: 1,
              height: 15,
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey)),
            ),
          ),
          _showSearchButton(),
          SizedBox(width: 5),
        ],
      ),
    );

    return current;
  }

  Widget _renderInput() {
    return TextFormField(
      controller: _txtController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      autofocus: false,
      readOnly: false,
      enabled: true,
      maxLines: 1,
      style: TextStyle(fontSize: 14, color: Colors.black),
      obscureText: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        // isDense: true,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12),
        hintText: '搜索地点',
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
        counterText: "",
        border: InputBorder.none,
      ),
      maxLength: 100,
    );
  }

  Widget _showClearIcon() {
    if (_showClear == false) return Container();

    Widget current = Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[400]),
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(1),
      child: Icon(Icons.clear, color: Colors.white, size: 10),
    );

    current = GestureDetector(
      onTap: () {
        setState(() {
          _showClear = false;
          _txtController.text = '';
        });
      },
      child: current,
    );

    return current;
  }

  Widget _showSearchButton() {
    Widget current = Text('搜索', style: TextStyle(color: Colors.blue));

    current = GestureDetector(
      onTap: () async {
        String keywords = _txtController.text.trim();
        if (keywords.length == 0) {
          _scaffoldkey.currentState.removeCurrentSnackBar();
          _scaffoldkey.currentState.showSnackBar(SnackBar(
            content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('请输入搜索内容')]),
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 2),
          ));

          return;
        }
      },
      child: current,
    );

    return current;
  }
}
