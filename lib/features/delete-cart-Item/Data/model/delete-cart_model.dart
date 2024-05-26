import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/entity/delete_cart_entity.dart';

class DeletCartItemModelResponse extends DeleteCartEntity with EquatableMixin{
  DeletCartItemModelResponse({this.message});
  final String? message;

  factory DeletCartItemModelResponse.fromJson(Map<String, dynamic> data) {
    return DeletCartItemModelResponse(message: data['message']);
  }
}
