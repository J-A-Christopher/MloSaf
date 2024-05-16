// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mlosafi/common/utils/storage_utils.dart' as _i5;
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart'
    as _i10;
import 'package:mlosafi/features/login/Data/repository/login_data_repo.dart'
    as _i12;
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart'
    as _i11;
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart'
    as _i4;
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart'
    as _i3;
import 'package:mlosafi/features/signup/data/datasources/signup_datas.dart'
    as _i13;
import 'package:mlosafi/features/signup/data/domain/data_domain.dart' as _i9;
import 'package:mlosafi/features/signup/domain/repository/signup_domrepo.dart'
    as _i8;
import 'package:mlosafi/features/signup/domain/usecases/signup_usecase.dart'
    as _i7;
import 'package:mlosafi/features/signup/presentation/bloc/sign_up_bloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LoginBloc>(() => _i3.LoginBloc());
    gh.factory<_i4.LoginUseCase>(() => _i4.LoginUseCase());
    gh.factory<_i5.StorageUtils>(() => _i5.StorageUtils());
    gh.factory<_i6.SignUpBloc>(() => _i6.SignUpBloc());
    gh.factory<_i7.SignUpUseCase>(() => _i7.SignUpUseCase());
    gh.factory<_i8.SignUpDomainRepo>(() => _i9.SignUpDataRepo());
    gh.factory<_i10.LoginDataSource>(() => _i10.LoginDataSourceImpl());
    gh.factory<_i11.LoginDomainRepo>(() => _i12.LoginDataRepo());
    gh.factory<_i13.SignUpDatasource>(() => _i13.SignUpDataSourceImpl());
    return this;
  }
}
