import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_flutter_app/widgets/app_font.dart';

import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({super.key, this.width = 70, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
              margin: EdgeInsets.only(left: 15),
                    child: AppFont(
                    text: "Book Trip now",
                    color: Colors.white,
                  ))
                : Container(),
            Container(
              margin: EdgeInsets.only(right: 10,left: 10),
              child: Image.asset(
                'assets/icons/right-arrow.png',
                height: 30.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
