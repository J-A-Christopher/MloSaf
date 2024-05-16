import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mlosafi/common/utils/exceptions.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/signup/data/datasources/signup_datas.dart';
import 'package:mlosafi/features/signup/domain/entities/signup_entity.dart';
import 'package:mlosafi/features/signup/domain/repository/signup_domrepo.dart';

@Injectable(as: SignUpDomainRepo)
class SignUpDataRepo implements SignUpDomainRepo {
  @override
  Future<Either<String, SignUpEntity>> signUpUser(
      Map<String, dynamic> signUpData) async {
    try {
      final signUpUser = await getIt<SignUpDatasource>().signUpUser(signUpData);
      return right(signUpUser);
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
