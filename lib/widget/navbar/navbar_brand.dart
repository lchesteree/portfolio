import 'package:flutter/material.dart';

class NavBarBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Chester Lee',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }
}
