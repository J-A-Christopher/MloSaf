import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-all-foods/Domain/entities/get-food-entity.dart';
import 'package:mlosafi/features/get-all-foods/Domain/usecases/get-food_usecase.dart';

part 'get_all_foods_event.dart';
part 'get_all_foods_state.dart';

@injectable
class GetAllFoodsBloc extends Bloc<GetAllFoodsEvent, GetAllFoodsState> {
  GetAllFoodsBloc() : super(GetAllFoodsInitial()) {
    on<GetAllFoods>((event, emit) async {
      emit(GetAllFoodsLoading());
      final getAllFoodUpUseCase =
          await getIt<GetAllFoodUseCase>().getFoodUseCase();

      getAllFoodUpUseCase.fold(
          (failure) => emit(GetAllFoodsError(errorMessage: failure)),
          (allFoodResponse) =>
              emit(GetAllFoodsLoaded(foodData: allFoodResponse)));
    });
  }
}
