part of 'cart_data_bloc.dart';

abstract class CartDataEvent extends Equatable {
  const CartDataEvent();

  @override
  List<Object> get props => [];
}

class GetCartData extends CartDataEvent {}
