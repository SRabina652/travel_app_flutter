import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLargeFont extends StatelessWidget {
  double size;
  String text;
  final Color color;
  TextLargeFont({Key? key,
    required this.text,
    this.color=Colors.black,
    this.size=30,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: (
        TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        )
    ),
    );
  }
}
