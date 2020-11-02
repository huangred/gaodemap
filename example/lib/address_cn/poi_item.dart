import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class POIItem extends StatelessWidget {
  final Poi poi;
  final bool selected;
  final Function onClick;
  final bool showSelectedIcon;

  const POIItem({Key key, @required this.poi, @required this.selected, this.onClick, this.showSelectedIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        this.showSelectedIcon == false
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(Icons.done, color: this.selected ? Colors.blue : Colors.transparent),
              ),
      ],
    );
    current = Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: current,
    );

    current = this.onClick == null ? current : GestureDetector(onTap: () => this.onClick(), child: current);

    return current;
  }
}
