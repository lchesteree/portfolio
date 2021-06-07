import 'package:flutter/material.dart';

import 'navigation_bar.dart';
import 'content/allContent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chester Lee',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black38),
        ),
      ),
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {
  final ScrollController sc = ScrollController();
  final GlobalKey<NavigationBarState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isDesktopView = MediaQuery.of(context).size.width > 800;
    bool isScrolledToTop = true;

    Map<String, Function> navigationButtonMap = {
      'EDUCATION': () => scrollToWidgetWhichKeyIs(Education.globalKey),
      'SKILLS': () => scrollToWidgetWhichKeyIs(Skill.globalKey),
      'EXPERINCE': () => scrollToWidgetWhichKeyIs(Experience.globalKey),
      'PROJECT': () => scrollToWidgetWhichKeyIs(Project.globalKey),
      'CONTACT': () => scrollToWidgetWhichKeyIs(Contact.globalKey),
    };

    sc.addListener(() {
      if (sc.offset == 0 && !isScrolledToTop) {
        _globalKey.currentState
            ?.notifyIsScrolledToTheTop(isScrolledToTop = true);
      } else if (sc.offset != 0 && isScrolledToTop) {
        _globalKey.currentState
            ?.notifyIsScrolledToTheTop(isScrolledToTop = false);
      }
    });

    return Scaffold(
      body: Scrollbar(
        controller: sc,
        thickness: 10,
        isAlwaysShown: true,
        radius: Radius.circular(8),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: sc,
              child: Column(
                children: [
                  const SizedBox(height: NavigationBar.height),
                  AboutMe(isDesktopView),
                  Education(),
                  Skill(),
                  Experience(),
                  Project(),
                  Contact(),
                ],
              ),
            ),
            // Navigation Bar
            NavigationBar(isDesktopView, navigationButtonMap, key: _globalKey),
          ],
        ),
      ),
    );
  }

  void scrollToWidgetWhichKeyIs(var globalKey) {
    Scrollable.ensureVisible(
      globalKey.currentContext,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuint,
    );
  }
}
