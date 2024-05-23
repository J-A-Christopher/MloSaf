import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/get-cart-items/Data/repository/cart_ds_repo.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';

class CartUseCase {
  Future<Either<String, CartEntity>> getCartUseCase() async {
    final cartData = await DomainAllCartRepoImpl().getCart();
    return cartData;
  }
}
