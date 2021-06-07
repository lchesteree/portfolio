import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavigationButton extends StatefulWidget {
  final Function onPressed;
  final String text;

  NavigationButton(this.text, this.onPressed);

  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => setIsHover(true),
      onExit: (event) => setIsHover(false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GestureDetector(
          onTap: () => widget.onPressed.call(),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isHover
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1!.color),
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
