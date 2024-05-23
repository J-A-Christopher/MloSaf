import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';

class GetCartData extends CartEntity with EquatableMixin {
  GetCartData({
    this.cartObject,
    this.totalAmount,
  });
  @override
  final Cart? cartObject;

  @override
  final int? totalAmount;

  factory GetCartData.fromJson(Map<String, dynamic> data) {
    return GetCartData(
        totalAmount: data['totalAmount'],
        cartObject: Cart.fromJson(data['cart']));
  }
}

class CartProduct {
  CartProduct(
      {this.description,
      this.foodId,
      this.fooodName,
      this.imageUrl,
      this.price,
      this.quantity});
  final String? foodId;
  final int? quantity;
  final String? fooodName;
  final int? price;
  final String? description;
  final String? imageUrl;

  factory CartProduct.fromJson(Map<String, dynamic> data) {
    return CartProduct(
        description: data['description'],
        foodId: data['foodId'],
        fooodName: data['name'],
        imageUrl: data['imageUrl'],
        price: data['price'],
        quantity: data['quantity']);
  }
}

class Cart {
  Cart({this.userId, this.cartItems});
  final String? userId;
  final List<CartProduct>? cartItems;

  factory Cart.fromJson(Map<String, dynamic> data) {
    return Cart(
        cartItems: List<CartProduct>.from(
            (data['items'] as List).map((item) => CartProduct.fromJson(item))),
        userId: data['userId']);
  }
}
