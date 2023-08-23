import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_flutter_app/cubit/app_cubits.dart';
import 'package:travel_flutter_app/cubit/app_cubits_logics.dart';
import 'package:travel_flutter_app/pages/detail_page.dart';
import 'package:travel_flutter_app/pages/navpages/main_page.dart';
import 'package:travel_flutter_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider<AppCubits>(
          create: (context)=>AppCubits(
            data: DataService(),
          ),
          child: AppCubitsLogics(),
        )
    );
  }
}
