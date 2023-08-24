import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_flutter_app/misc/colors.dart';
import 'package:travel_flutter_app/widgets/app_font.dart';

import '../../cubit/app_cubit_states.dart';
import '../../cubit/app_cubits.dart';
import '../../widgets/text_large_font.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "hiking.png": "hiking",
    "hot-air-balloon.png": "hotairballon",
    "kayak.png": "kayak",
    "mountain.png": "mountain",
    "snorking.png": "snorking"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is LoadedState){
            var info= state.places;
            return  Padding(
              padding: const EdgeInsets.fromLTRB(20, 80.0, 20.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 39,
                          color: Colors.black,
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextLargeFont(text: "Discover"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Align(
                      //alignment, isScroable and labelPadding works together
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircleTabIndicator(
                              color: AppColors.mainColor, radius: 4),
                          tabs: [
                            Tab(
                              text: "Places",
                            ),
                            Tab(
                              text: "inspiration",
                            ),
                            Tab(
                              text: "Emotions",
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 330,
                    width: double.maxFinite,
                    child: Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: info.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  BlocProvider.of<AppCubits>(context).DetailPage(info[index]);
                                },
                                child: Container(
                                  width: 200,
                                  height: 330,
                                  margin: EdgeInsets.only(right: 10, top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Text("hello"),
                          Text("data"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLargeFont(
                          text: "Explore",
                          size: 20,
                        ),
                        AppFont(
                          text: "see all",
                          color: AppColors.colorOne,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 40),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/welcome/" +
                                        image.keys.elementAt(index)),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: AppFont(text: image.values.elementAt(index)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }else{
            return Container();
          }
        }
      )
    );
  }
}

class CircleTabIndicator extends Decoration {
  Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
