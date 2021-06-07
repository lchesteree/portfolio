import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'widget/navbar/navigation_button.dart';
import 'widget/navbar/navigation_drop_down_list_item.dart';
import 'widget/navbar/navbar_brand.dart';

class NavigationBar extends StatefulWidget {
  static const double height = 80;
  final bool isDesktopView;
  final Map<String, Function> navigationButtonMap;

  NavigationBar(this.isDesktopView, this.navigationButtonMap, {Key? key})
      : super(key: key);

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isOpenDropDownList = false,
      isForceClose = false,
      isScrolledToTop = true;

  final List<NavigationButton> buttonList = [];

  @override
  void initState() {
    // Drop down list animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: -NavigationDropDownListItem.height * 4 + NavigationBar.height,
      end: NavigationBar.height,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease))
      ..addListener(() {
        // if force close, no need to set state, because I don't need the animation to avoid Build scheduled during frame.
        if (!isForceClose) setState(() {});
      });

    widget.navigationButtonMap.forEach((key, value) {
      buttonList.add(NavigationButton(key, value));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget navigationBar = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: buttonList,
    );

    return Container(
      height: NavigationDropDownListItem.height * 4 + NavigationBar.height,
      child: Stack(
        children: [
          // Drop down list
          Positioned(
            left: 0,
            right: 0,
            top: _animation.value,
            child: NotificationListener(
              onNotification: (notification) {
                // if the size of device is changed, close the drop down list immediately
                if (isOpenDropDownList) {
                  isOpenDropDownList = false;
                  isForceClose = true;
                  _controller.reset();
                  isForceClose = false;
                }
                return false;
              },
              child: SizeChangedLayoutNotifier(
                child: Material(
                  elevation: isOpenDropDownList ? 5 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NavigationDropDownListItem('AAAA'),
                      NavigationDropDownListItem('BBBB'),
                      NavigationDropDownListItem('AAAA'),
                      NavigationDropDownListItem('BBBB'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Navigation Bar
          Material(
            elevation: isOpenDropDownList
                ? 0
                : isScrolledToTop
                    ? 0
                    : 5,
            child: Container(
              height: NavigationBar.height,
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: widget.isDesktopView
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NavBarBrand(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: widget.isDesktopView
                        ? navigationBar
                        : buildDropDownButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDownButton() {
    const Color buttonColor = Colors.black;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onClickDropDownButton();
        },
        child: Container(
          height: 40,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(color: buttonColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isOpenDropDownList ? Icons.close : Icons.menu,
            color: buttonColor,
          ),
        ),
      ),
    );
  }

  void onClickDropDownButton() {
    if (isOpenDropDownList)
      _controller.reverse();
    else
      _controller.forward();
    isOpenDropDownList = !isOpenDropDownList;
  }

  void notifyIsScrolledToTheTop(bool value) {
    setState(() {
      isScrolledToTop = value;
    });
  }
}
