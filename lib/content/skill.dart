import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';

class Skill extends StatelessWidget {
  static final GlobalKey globalKey = GlobalKey(debugLabel: 'Skill Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: Column(
        children: [
          TitleOfThisPart("Skill"),
          Container(height: 400, width: double.infinity, color: Colors.blueGrey),
        ],
      ),
    );
  }
}
