import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key,this.width,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/right-arrow.png',
            height: 30.0,
            color: Colors.white,),
        ],
      ),
    );
  }
}
