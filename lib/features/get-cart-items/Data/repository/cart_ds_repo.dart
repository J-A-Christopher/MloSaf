import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-cart-items/Data/datsources/datasrc.dart';
import 'package:mlosafi/features/get-cart-items/Domain/entities/all-cart.dart';
import 'package:mlosafi/features/get-cart-items/Domain/repository/all-cart-repo-domain.dart';

@Injectable(as: DomainAllCartRepo)
class DomainAllCartRepoImpl implements DomainAllCartRepo {
  @override
  Future<Either<String, CartEntity>> getCart() async {
    try {
      final cartData = await getIt<GetCartItems>().getCartItems();
      return right(cartData);
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
