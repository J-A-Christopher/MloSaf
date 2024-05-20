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
import 'package:mlosafi/features/get-all-foods/Data/datasources/get_all_foodds.dart'
    as _i12;
import 'package:mlosafi/features/get-all-foods/Data/repository/get_all_food_data.dart'
    as _i14;
import 'package:mlosafi/features/get-all-foods/Domain/repository/get-all-domain.-repo.dart'
    as _i13;
import 'package:mlosafi/features/get-all-foods/Domain/usecases/get-food_usecase.dart'
    as _i9;
import 'package:mlosafi/features/get-all-foods/Presentation/bloc/get_all_foods_bloc.dart'
    as _i8;
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart'
    as _i15;
import 'package:mlosafi/features/login/Data/repository/login_data_repo.dart'
    as _i17;
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart'
    as _i16;
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart'
    as _i4;
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart'
    as _i3;
import 'package:mlosafi/features/signup/data/datasources/signup_datas.dart'
    as _i18;
import 'package:mlosafi/features/signup/data/domain/data_domain.dart' as _i11;
import 'package:mlosafi/features/signup/domain/repository/signup_domrepo.dart'
    as _i10;
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
    gh.factory<_i8.GetAllFoodsBloc>(() => _i8.GetAllFoodsBloc());
    gh.factory<_i9.GetAllFoodUseCase>(() => _i9.GetAllFoodUseCase());
    gh.factory<_i10.SignUpDomainRepo>(() => _i11.SignUpDataRepo());
    gh.factory<_i12.GetAllFoodData>(() => _i12.GetAllFoodDataImpl());
    gh.factory<_i13.GetAllFoodDomainRepo>(
        () => _i14.GetAllFoodDomainRepoImpl());
    gh.factory<_i15.LoginDataSource>(() => _i15.LoginDataSourceImpl());
    gh.factory<_i16.LoginDomainRepo>(() => _i17.LoginDataRepo());
    gh.factory<_i18.SignUpDatasource>(() => _i18.SignUpDataSourceImpl());
    return this;
  }
}
