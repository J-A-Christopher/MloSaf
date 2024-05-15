// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart'
    as _i5;
import 'package:mlosafi/features/login/Data/repository/login_data_repo.dart'
    as _i7;
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart'
    as _i6;
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart'
    as _i4;
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart'
    as _i3;

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
    gh.factory<_i5.LoginDataSource>(() => _i5.LoginDataSourceImpl());
    gh.factory<_i6.LoginDomainRepo>(() => _i7.LoginDataRepo());
    return this;
  }
}
