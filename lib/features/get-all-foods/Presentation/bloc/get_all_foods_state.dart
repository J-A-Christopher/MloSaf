part of 'get_all_foods_bloc.dart';

abstract class GetAllFoodsState extends Equatable {
  const GetAllFoodsState();

  @override
  List<Object> get props => [];
}

class GetAllFoodsInitial extends GetAllFoodsState {}

class GetAllFoodsLoading extends GetAllFoodsState {}

class GetAllFoodsLoaded extends GetAllFoodsState {
  const GetAllFoodsLoaded({required this.foodData});
  final List<GetFoodEntity> foodData;
}

class GetAllFoodsError extends GetAllFoodsState {
  const GetAllFoodsError({required this.errorMessage});
  final String errorMessage;
}
