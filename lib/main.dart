import 'package:flutter/material.dart';

import 'widget/navigation/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chester Lee',
      theme: ThemeData(
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
  @override
  Widget build(BuildContext context) {
    bool isDesktopView = MediaQuery.of(context).size.width > 800;

    Map<String, Function> navigationButtonMap = {
      'EDUCATION': () {},
      'SKILLS': () {},
      'EXPERINCE': () {},
      'PROJECT': () {},
      'CONTACT': () {},
    };

    return Scaffold(
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        radius: Radius.circular(8),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: NavigationBar.height),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.teal.withOpacity(0.5),
                    child: TextButton(
                      onPressed: () {
                        print('vvv');
                      },
                      child: Text('AAA'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.brown,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            // Navigation Bar
            NavigationBar(isDesktopView, navigationButtonMap),
          ],
        ),
      ),
    );
  }
}
