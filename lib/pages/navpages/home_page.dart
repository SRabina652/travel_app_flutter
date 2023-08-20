import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_large_font.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController= TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 29, color: Colors.black,),
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
            SizedBox(height: 30.0,),
            TextLargeFont(text: "Discover"),
            SizedBox(height: 20.0,),
            Container(
              child: Align(
                //alignment, isScroable and labelPadding works together
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 20,right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Places",),
                      Tab(text: "inspiration",),
                      Tab(text: "Emotions",),
                    ]
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:[
                    Text("hi there"),
                    Text("hello"),
                    Text("data"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
