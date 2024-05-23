import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';
import 'package:mlosafi/features/get-cart-items/Domain/usecases/get_cart_usecase.dart';

part 'cart_data_event.dart';
part 'cart_data_state.dart';

class CartDataBloc extends Bloc<CartDataEvent, CartDataState> {
  CartDataBloc() : super(CartDataInitial()) {
    on<GetCartData>((event, emit) async {
      emit(CartDataLoading());
      final getCartData = await CartUseCase().getCartUseCase();

      getCartData.fold((failure) => emit(CartDataError(message: failure)),
          (cartData) => emit(CartDataLoaded(cartData: cartData)));
    });
  }
}
