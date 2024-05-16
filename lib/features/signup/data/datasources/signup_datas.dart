import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/constants.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/features/signup/data/models/signupmodelresponse.dart';

abstract class SignUpDatasource {
  Future<SignUpModelResponse> signUpUser(Map<String, dynamic> userData);
}

@Injectable(as: SignUpDatasource)
class SignUpDataSourceImpl implements SignUpDatasource {
  @override
  Future<SignUpModelResponse> signUpUser(Map<String, dynamic> userData) async {
    final dio = Dio();
    try {
      final result = await dio.post(
        '$baseUrl/register',
        data: userData,
        options: Options(sendTimeout: const Duration(seconds: 10)),
      );
      return SignUpModelResponse.fromJson(result.data);
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
