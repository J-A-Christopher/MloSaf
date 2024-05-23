import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';

abstract class DomainAllCartRepo {
  Future<Either<String, CartEntity>> getCart();
}
