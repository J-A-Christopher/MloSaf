import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart';
import 'package:mlosafi/features/login/Domain/entities/login_entity.dart';
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart';

@Injectable(as: LoginDomainRepo)
class LoginDataRepo implements LoginDomainRepo {
  @override
  Future<Either<String, LoginEntity>> loginUser(
      Map<String, dynamic> loginData) async {
    try {
      final loginUser = getIt<LoginDataSource>();
      final loginResData = await loginUser.loginUser(loginData);

      return right(loginResData);
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
