import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';

class Project extends StatelessWidget {
  static final GlobalKey globalKey = GlobalKey(debugLabel: 'Project Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: Column(
        children: [
          TitleOfThisPart("Project"),
          Container(height: 600, width: double.infinity, color: Colors.lime)
        ],
      ),
    );
  }
}
