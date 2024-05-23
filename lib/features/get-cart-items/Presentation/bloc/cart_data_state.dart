part of 'cart_data_bloc.dart';

abstract class CartDataState extends Equatable {
  const CartDataState();

  @override
  List<Object> get props => [];
}

class CartDataInitial extends CartDataState {}

class CartDataLoading extends CartDataState {}

class CartDataLoaded extends CartDataState {
  const CartDataLoaded({required this.cartData});
  final CartEntity cartData;
}

class CartDataError extends CartDataState {
  const CartDataError({required this.message});
  final String? message;
}
