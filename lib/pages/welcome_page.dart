import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_flutter_app/cubit/app_cubits.dart';

import '../misc/colors.dart';
import '../widgets/app_font.dart';
import '../widgets/button_responsive.dart';
import '../widgets/text_large_font.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['one.jpg', 'two.jpg', 'three.jpg'];
  List textTopics=['Desert Peaks',
    'Deserts','Grenary'];
  List texts = [
    'Deseret Peak is the highest peak in the Stansbury Mountains with an elevation of 11,035 ft.',
    'And most deserts, far from being empty and lifeless, '
        'are home to a variety of plants, animals, and other organisms.',
    'Nature, in the broadest sense, is the physical world or universe.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/welcome/" + images[index],
                    ),
                    fit: BoxFit.fill,
                  )),
              child: Container(
                  margin: EdgeInsets.only(top: 100.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLargeFont(
                            text: 'Trips',
                          ),
                          AppFont(
                            text: textTopics[index],
                            size: 30,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: 300,
                            child: AppFont(
                              text: texts[index],
                              color: AppColors.colorTwo,
                            ),
                          ),
                          SizedBox(height: 70,),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 120,
                                child: Row(children: [ResponsiveButton(width: 100,)])
                            ),
                          ),
                        ],
                      ),
                      Column(children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index==indexDots?30:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
