import 'package:equatable/equatable.dart';
import 'package:sample_app/src/models/get_food_data_response.dart';

class FoodStates extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FoodInitialState extends FoodStates {}

class FoodLoadingState extends FoodStates {}

class FoodLoadedState extends FoodStates {
  final List<FoodDataResponse> foodDataList;
  FoodLoadedState({this.foodDataList});
}

class FoodErrorState extends FoodStates {
  final String error;
  FoodErrorState({this.error});
}