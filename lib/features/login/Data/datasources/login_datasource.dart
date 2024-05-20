import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/features/login/Data/model/login_response.dart';

abstract class LoginDataSource {
  Future<LoginResponse> loginUser(Map<String, dynamic> loginData);
}

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginResponse> loginUser(Map<String, dynamic> loginData) async {
    final dio = Dio();
    try {
      final result = await dio.post(
        '$baseUrl/login',
        data: loginData,
        options: Options(sendTimeout: const Duration(seconds: 10)),
      );
      return LoginResponse.fromJson(result.data);
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
