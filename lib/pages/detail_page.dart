import 'package:flutter/material.dart';
import 'package:travel_flutter_app/misc/colors.dart';
import 'package:travel_flutter_app/widgets/app_button.dart';
import 'package:travel_flutter_app/widgets/app_font.dart';
import 'package:travel_flutter_app/widgets/button_responsive.dart';
import 'package:travel_flutter_app/widgets/text_large_font.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int stargiven = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome/three.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 310,
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextLargeFont(
                            text: "Desert",
                            color: Colors.black87.withOpacity(0.7),
                          ),
                          AppFont(
                            text: "\$250",
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppFont(
                            text: "Sagarmatha, Nepal",
                            size: 15,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < stargiven
                                  ? AppColors.starColor
                                  : AppColors.colorTwo,
                            );
                          })),
                          SizedBox(
                            width: 10,
                          ),
                          AppFont(text: "(4.0)"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextLargeFont(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                      ),
                      AppFont(text: "Number of people in your group"),
                      Wrap(
                          children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: AppButton(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black87,
                              BackgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.5),
                              size: 50,
                              borderColor: AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      })),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextLargeFont(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(height: 10,),
                      AppFont(
                          text:
                              "Most experts agree that a desert is an area of land that receives no more than 25 centimeters (10 inches) of precipitation a year."),
                      SizedBox(height: 30,),
                      Positioned(
                        right: 20,
                        child: Row(
                          children: [

                            AppButton(
                              BackgroundColor: AppColors.buttonBackground,
                              color: Colors.black87,
                              size: 50,
                              borderColor: Colors.black87,
                              istext: false,
                              iconData: Icons.favorite_border,
                            ),
                            SizedBox(width: 20,),
                            ResponsiveButton(isResponsive:true)
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
