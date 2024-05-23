import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/add-to-cart/Data/datasources/datasource.dart';
import 'package:mlosafi/features/add-to-cart/Domain/entities/add_to_cart_entity.dart';
import 'package:mlosafi/features/add-to-cart/Domain/repository/dom_repo_add_cart.dart';

@Injectable(as: DomainAddToCart)
class DataAddToCart implements DomainAddToCart {
  @override
  Future<Either<String, AddToCartEntity>> addToCart(
      {required String foodId}) async {
    try {
      final addToCart = await getIt<AddToCart>().addToCart(foodId: foodId);

      return right(addToCart);
    } on RequestException catch (e) {
      return left(e.message);
    } on NetworkException catch (e) {
      return left(e.message);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return left('An unknown error occurred. Try again later');
    }
  }
}
