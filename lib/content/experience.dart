import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';

class Experience extends StatelessWidget {
  static final GlobalKey globalKey = GlobalKey(debugLabel: 'Experience Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: Column(
        children: [
          TitleOfThisPart("Experience"),
          Container(height: 400, width: double.infinity, color: Colors.purpleAccent),
        ],
      ),
    );
  }
}
