import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';
import 'package:mlosafi/features/get-cart-items/Domain/repository/all-cart-repo-domain.dart';

@injectable
class CartUseCase {
  Future<Either<String, CartEntity>> getCartUseCase() async {
    final cartData = await getIt<DomainAllCartRepo>().getCart();
    return cartData;
  }
}
