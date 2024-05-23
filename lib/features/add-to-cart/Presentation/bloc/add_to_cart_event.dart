part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class AddItemToCart extends AddToCartEvent {
  AddItemToCart({required this.foodId});
  String foodId;
}
