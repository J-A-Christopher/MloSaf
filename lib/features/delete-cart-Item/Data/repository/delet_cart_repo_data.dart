import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/delete-cart-Item/Data/datasource/datasource.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/entity/delete_cart_entity.dart';
import 'package:mlosafi/features/delete-cart-Item/Domain/repository/delete_cart_repo.dart';

@Injectable(as: DeleteCartItemRepository)
class DeleteCartRepo implements DeleteCartItemRepository {
  @override
  Future<Either<String, DeleteCartEntity>> deleteCartItem(
      {required int foodId}) async {
    try {
      final deletCartItem =
          await getIt<DeleteCartItem>().deleteCrtItem(foodId: foodId);

      return right(deletCartItem);
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
