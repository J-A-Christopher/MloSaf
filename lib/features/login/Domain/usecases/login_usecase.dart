import 'package:dartz/dartz.dart';
import 'package:mlosafi/common/utils/failures.dart';
import 'package:mlosafi/features/login/Data/repository/login_data_repo.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';

class LoginUseCase {
  Future<Either<Failure, LoginEntity>> loginEntity(
      Map<String, dynamic> loginData) async {
    final loginUser = await LoginDataRepo().loginUser(loginData);
    return loginUser;
  }
}
