import 'package:dio/dio.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/get-cart-items/Data/models/get_cart_item_model.dart';

abstract class GetCartItems {
  Future<GetCartData> getCartItems();
}

class GetCartItemsImpl implements GetCartItems {
  @override
  Future<GetCartData> getCartItems() async {
    final dio = Dio();
    final token = await getIt<StorageUtils>().getUserInfo(key: 'token');
    try {
      final result = await dio.get(
        '$baseUrl/get-cart-details',
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          headers: {'Accept': 'application/json', 'token': token},
        ),
      );

      final cartData = GetCartData.fromJson(result.data);

      return cartData;
    } on DioException catch (e) {
      if (e.response != null) {
        final requestMessage = e.response!.data['message'];
        throw RequestException(requestMessage);
      } else {
        //When device is offline
        String? errorMessage = e.message;
        int colonIndex = errorMessage!.indexOf(':');
        String extractedPart =
            "${errorMessage.substring(0, colonIndex).trim()} are you online?";

        throw NetworkException(extractedPart);
      }
    }
  }
}
