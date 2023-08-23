import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_flutter_app/widgets/app_font.dart';
import 'package:travel_flutter_app/widgets/text_large_font.dart';

class AppButton extends StatelessWidget {
  Color BackgroundColor;
  Color color;
  double size;
  Color borderColor;
  String? text;
  bool istext;
  IconData? iconData;

  AppButton(
      {super.key,
      required this.BackgroundColor,
      required this.color,
      this.text,
      this.iconData,
      this.istext = true,
      required this.size,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        color: BackgroundColor,
      ),
      child: istext == true
          ? Center(
              child: TextLargeFont(
              text: text!,
              size: 20,
              color: color,
            ))
          : Center(
              child: Icon(
              iconData,
              color: color,
            )),
    );
  }
}
