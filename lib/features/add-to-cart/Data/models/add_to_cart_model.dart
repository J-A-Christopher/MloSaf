import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/add-to-cart/Domain/entities/add_to_cart_entity.dart';

class AddToCartResponse extends AddToCartEntity with EquatableMixin {
  AddToCartResponse({this.message});
  final String? message;

  factory AddToCartResponse.fromJson(Map<String, dynamic> data) {
    return AddToCartResponse(message: data['message']);
  }
}
