import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/add-to-cart/Domain/usecases/add-to-cart_usecase.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

@injectable
class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitial()) {
    on<AddItemToCart>((event, emit) async {
      emit(AddToCartLoading());
      final addToCartUseCases =
          await getIt<AddToCartUseCase>().loginEntity(foodId: event.foodId);
      addToCartUseCases
          .fold((failure) => emit(AddToCartError(errorMessage: failure)),
              (addToCartResponse) {
        emit(AddToCartLoaded(cartMessage: addToCartResponse.message ?? ''));
      });
    });
  }
}
