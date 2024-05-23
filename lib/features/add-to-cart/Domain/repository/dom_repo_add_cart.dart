import 'package:dartz/dartz.dart';
import 'package:mlosafi/features/add-to-cart/Domain/entities/add_to_cart_entity.dart';

abstract class DomainAddToCart{
   Future<Either<String, AddToCartEntity>> addToCart({required String foodId});
}
