import 'package:bloc/bloc.dart';
import 'package:travel_flutter_app/cubit/app_cubit_states.dart';
import 'package:travel_flutter_app/model/data_model.dart';
import 'package:travel_flutter_app/pages/detail_page.dart';
import 'package:travel_flutter_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}):super(InitialState()){
    emit(WelcomeState());
  }

  final DataService data;
  late final places;
  void getData() async{
    try{
      emit(LoadingState());
      places= await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
      print(e);
    }
  }
  DetailPage(DataModel data){
    emit(DetailState(data));
  }
  GoHome(){
    emit(LoadedState(places));
  }
}