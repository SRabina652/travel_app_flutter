import 'package:bloc/bloc.dart';
import 'package:travel_flutter_app/cubit/app_cubit_states.dart';

class AppCubits extends Cubit{
  AppCubits():super(InitialState()){
    emit(WelcomeState());
  }
}