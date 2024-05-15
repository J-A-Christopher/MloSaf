import 'package:dartz/dartz.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/common/utils/failures.dart';
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  @override
  Future<Either<Failure, LoginEntity>> loginUser(
      Map<String, dynamic> loginData) async {
    try {
      final loginUser = LoginDataSourceImpl();
      final loginResData = await loginUser.loginUser(loginData);

      return right(loginResData);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return left(GeneralFailure());
    }
  }
}
