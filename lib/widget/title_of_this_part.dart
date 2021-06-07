import 'package:flutter/material.dart';

class TitleOfThisPart extends StatelessWidget {
  final String name;
  TitleOfThisPart(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
