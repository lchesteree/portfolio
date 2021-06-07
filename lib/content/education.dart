import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';

class Education extends StatelessWidget {
  static final GlobalKey globalKey = GlobalKey(debugLabel: 'Education Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      key: globalKey,
      child: Column(
        children: [
          TitleOfThisPart("Education"),
          Container(height: 350, width: double.infinity, color: Colors.blue)
        ],
      ),
    );
  }
}
