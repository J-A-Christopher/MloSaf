import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart';

@injectable
class LoginUseCase {
  Future<Either<String, LoginEntity>> loginEntity(
      Map<String, dynamic> loginData) async {
    final loginUser = await getIt<LoginDomainRepo>().loginUser(loginData);
    return loginUser;
  }
}
