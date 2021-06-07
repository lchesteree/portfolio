import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';

class Contact extends StatelessWidget {
  static final GlobalKey globalKey = GlobalKey(debugLabel: 'Contact Key');


  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: Column(
        children: [
          TitleOfThisPart("Contact"),
          Container(height: 400, width: double.infinity, color: Colors.amberAccent),
        ],
      ),
    );
  }
}
