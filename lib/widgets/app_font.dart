import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFont extends StatelessWidget {
  double size;
  String text;
  Color color;
  AppFont({Key? key,
    this.size=18,
    this.color=Colors.black54,
    required this.text
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: (
        TextStyle(
          fontSize: size,
          color: color,
          letterSpacing: 2,
        )
    ),
    );
  }
}
