import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavigationDropDownListItem extends StatefulWidget {
  static double height = 46;
  final String name;

  NavigationDropDownListItem(this.name);

  @override
  _NavigationDropDownListItemState createState() =>
      _NavigationDropDownListItemState();
}

class _NavigationDropDownListItemState
    extends State<NavigationDropDownListItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setIsHover(true),
      onExit: (event) => setIsHover(false),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: NavigationDropDownListItem.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 18, color: isHover ? Colors.blue : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void setIsHover(bool isHover, {bool needSetState = true}) {
    if (!needSetState) {
      this.isHover = isHover;
      return;
    }

    setState(() {
      this.isHover = isHover;
    });
  }
}
