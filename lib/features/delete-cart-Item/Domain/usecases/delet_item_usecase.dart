import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/entity/delete_cart_entity.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/repository/delete_cart_repo.dart';

@injectable
class DeleteCartItemUseCase {
  Future<Either<String, DeleteCartEntity>> deleteFoodItem(
      {required int foodId}) async {
    final deleteCartItem =
        await getIt<DeleteCartItemRepository>().deleteCartItem(foodId: foodId);
    return deleteCartItem;
  }
}
