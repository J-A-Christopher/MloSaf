import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/add-to-cart/Domain/entities/add_to_cart_entity.dart';
import 'package:mlosafi/features/add-to-cart/Domain/repository/dom_repo_add_cart.dart';

@injectable
class AddToCartUseCase {
  Future<Either<String, AddToCartEntity>> loginEntity(
      {required String foodId}) async {
    final addToCartData =
        await getIt<DomainAddToCart>().addToCart(foodId: foodId);
    return addToCartData;
  }
}
