import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/get-cart-items/Data/models/get_cart_item_model.dart';

class CartEntity extends Equatable {
  const CartEntity({this.cartObject, this.totalAmount});
  final Cart? cartObject;

  final int? totalAmount;

  @override
  List<Object?> get props => [cartObject, totalAmount];
}
