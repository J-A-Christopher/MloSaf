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
import 'package:mlosafi/features/add-to-cart/Data/datasources/datasource.dart'
    as _i29;
import 'package:mlosafi/features/add-to-cart/Data/repository/data_add-to-cart.dart'
    as _i28;
import 'package:mlosafi/features/add-to-cart/Domain/repository/dom_repo_add_cart.dart'
    as _i27;
import 'package:mlosafi/features/add-to-cart/Domain/usecases/add-to-cart_usecase.dart'
    as _i11;
import 'package:mlosafi/features/add-to-cart/Presentation/bloc/add_to_cart_bloc.dart'
    as _i10;
import 'package:mlosafi/features/delete-cart-Item/Data/datasource/datasource.dart'
    as _i20;
import 'package:mlosafi/features/delete-cart-Item/Data/repository/delet_cart_repo_data.dart'
    as _i22;
import 'package:mlosafi/features/delete-cart-Item/Domain/repository/delete_cart_repo.dart'
    as _i21;
import 'package:mlosafi/features/delete-cart-Item/Domain/usecases/delet_item_usecase.dart'
    as _i15;
import 'package:mlosafi/features/delete-cart-Item/presentation/bloc/delete_cart_item_bloc.dart'
    as _i14;
import 'package:mlosafi/features/get-all-foods/Data/datasources/get_all_foodds.dart'
    as _i23;
import 'package:mlosafi/features/get-all-foods/Data/repository/get_all_food_data.dart'
    as _i25;
import 'package:mlosafi/features/get-all-foods/Domain/repository/get-all-domain.-repo.dart'
    as _i24;
import 'package:mlosafi/features/get-all-foods/Domain/usecases/get-food_usecase.dart'
    as _i9;
import 'package:mlosafi/features/get-all-foods/Presentation/bloc/get_all_foods_bloc.dart'
    as _i8;
import 'package:mlosafi/features/get-cart-items/Data/datsources/datasrc.dart'
    as _i33;
import 'package:mlosafi/features/get-cart-items/Data/repository/cart_ds_repo.dart'
    as _i17;
import 'package:mlosafi/features/get-cart-items/Domain/repository/all-cart-repo-domain.dart'
    as _i16;
import 'package:mlosafi/features/get-cart-items/Domain/usecases/get_cart_usecase.dart'
    as _i13;
import 'package:mlosafi/features/get-cart-items/Presentation/bloc/cart_data_bloc.dart'
    as _i12;
import 'package:mlosafi/features/login/Data/datasources/login_datasource.dart'
    as _i26;
import 'package:mlosafi/features/login/Data/repository/login_data_repo.dart'
    as _i31;
import 'package:mlosafi/features/login/Domain/repository/login_domain_repo.dart'
    as _i30;
import 'package:mlosafi/features/login/Domain/usecases/login_usecase.dart'
    as _i4;
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart'
    as _i3;
import 'package:mlosafi/features/signup/data/datasources/signup_datas.dart'
    as _i32;
import 'package:mlosafi/features/signup/data/domain/data_domain.dart' as _i19;
import 'package:mlosafi/features/signup/domain/repository/signup_domrepo.dart'
    as _i18;
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
    gh.factory<_i10.AddToCartBloc>(() => _i10.AddToCartBloc());
    gh.factory<_i11.AddToCartUseCase>(() => _i11.AddToCartUseCase());
    gh.factory<_i12.CartDataBloc>(() => _i12.CartDataBloc());
    gh.factory<_i13.CartUseCase>(() => _i13.CartUseCase());
    gh.factory<_i14.DeleteCartItemBloc>(() => _i14.DeleteCartItemBloc());
    gh.factory<_i15.DeleteCartItemUseCase>(() => _i15.DeleteCartItemUseCase());
    gh.factory<_i16.DomainAllCartRepo>(() => _i17.DomainAllCartRepoImpl());
    gh.factory<_i18.SignUpDomainRepo>(() => _i19.SignUpDataRepo());
    gh.factory<_i20.DeleteCartItem>(() => _i20.DeleteCartItemImpl());
    gh.factory<_i21.DeleteCartItemRepository>(() => _i22.DeleteCartRepo());
    gh.factory<_i23.GetAllFoodData>(() => _i23.GetAllFoodDataImpl());
    gh.factory<_i24.GetAllFoodDomainRepo>(
        () => _i25.GetAllFoodDomainRepoImpl());
    gh.factory<_i26.LoginDataSource>(() => _i26.LoginDataSourceImpl());
    gh.factory<_i27.DomainAddToCart>(() => _i28.DataAddToCart());
    gh.factory<_i29.AddToCart>(() => _i29.AddToCartImpl());
    gh.factory<_i30.LoginDomainRepo>(() => _i31.LoginDataRepo());
    gh.factory<_i32.SignUpDatasource>(() => _i32.SignUpDataSourceImpl());
    gh.factory<_i33.GetCartItems>(() => _i33.GetCartItemsImpl());
    return this;
  }
}
