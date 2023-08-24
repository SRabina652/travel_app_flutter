import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_flutter_app/cubit/app_cubit_states.dart';
import 'package:travel_flutter_app/cubit/app_cubits.dart';
import 'package:travel_flutter_app/pages/detail_page.dart';
import 'package:travel_flutter_app/pages/navpages/home_page.dart';
import 'package:travel_flutter_app/pages/welcome_page.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({super.key});

  @override
  State<AppCubitsLogics> createState() => _AppCubitsLogicsState();
}

class _AppCubitsLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is DetailState){
            return DetailPage();
          }
          if(state is LoadedState){
            return HomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        }
      )

    );
  }
}
