import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BackToTopButton extends StatefulWidget {
  final Function onClick;

  BackToTopButton(this.onClick);

  @override
  _BackToTopButtonState createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  final double size = 40;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: ()=> widget.onClick.call(),
        child: Container(
          height: size,
          width: size,
          decoration: !isHover
              ? BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          )
              : BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Icon(
            Icons.keyboard_arrow_up,
            color: isHover ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
      )
    );
  }
}
