import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/entity/delete_cart_entity.dart';

abstract class DeleteCartItemRepository {
  Future<Either<String, DeleteCartEntity>> deleteCartItem({required int foodId});
}
