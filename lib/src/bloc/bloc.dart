import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/src/api/exception.dart';
import 'package:sample_app/src/api/services.dart';
import 'package:sample_app/src/bloc/events.dart';
import 'package:sample_app/src/bloc/states.dart';
import 'package:sample_app/src/models/get_food_data_response.dart';

class FoodBloc extends Bloc<FoodEvents, FoodStates> {
  List<FoodDataResponse> getFoodList;
  final FoodRepo foodRepo;
  FoodBloc({this.foodRepo, this.getFoodList}) : super(FoodInitialState());
  @override
  Stream<FoodStates> mapEventToState(FoodEvents event) async*{
    // TODO: implement mapEventToState
    switch(event) {
      case FoodEvents.fetchFoodList :
        yield FoodLoadingState();
        print("Loading");
        try {
          getFoodList = await foodRepo.getFoodList();
          FoodLoadedState(foodDataList: getFoodList);
        } on HttpException {
          NoServicesFoundException("No service Found ");
        } on SocketException {
          NoInternetException("No Internet");
        } on FormatException {
          InvalidFormatException("Invalid Format");
        } catch(e) {
          UnknownException("Unknown Exception");
        }
        break;
    }
  }

}