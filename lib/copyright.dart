import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Center(
        child: const SelectableText('© Copyright Lee Cheuk Tung 2021'),
      ),
    );
  }
}
