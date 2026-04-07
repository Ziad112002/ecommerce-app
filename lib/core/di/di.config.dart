// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repository/auth_repo_impl.dart' as _i751;
import '../../features/auth/data/repository/data_sources/auth_remote_data_source.dart'
    as _i408;
import '../../features/auth/data/repository/data_sources/auth_remote_data_source_impl.dart'
    as _i1068;
import '../../features/auth/domain/repository/auth_repo.dart' as _i976;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/screens/cubit/auth_cubit.dart'
    as _i219;
import '../../features/cart/data/repositories/cart_repository/cart_repo_impl.dart'
    as _i582;
import '../../features/cart/data/repositories/cart_repository/data_source/remote_cart_data_source.dart'
    as _i1071;
import '../../features/cart/data/repositories/cart_repository/data_source/remote_cart_data_source_impl.dart'
    as _i85;
import '../../features/cart/domain/repository/cart_repo.dart' as _i209;
import '../../features/cart/domain/use_case/add_to_cart_use_case.dart' as _i956;
import '../../features/cart/domain/use_case/delete_from_cart_use_case.dart'
    as _i865;
import '../../features/cart/domain/use_case/get_cart_use_case.dart' as _i38;
import '../../features/cart/domain/use_case/update_cart%20_product_quantity_use_case.dart'
    as _i302;
import '../../features/main_layout/data/repositories/home/data_sources/home_remote_data_source.dart'
    as _i239;
import '../../features/main_layout/data/repositories/home/data_sources/home_remote_data_source_impl.dart'
    as _i26;
import '../../features/main_layout/data/repositories/home/home_repo_impl.dart'
    as _i599;
import '../../features/main_layout/domain/repositories/home_repo.dart' as _i515;
import '../../features/main_layout/domain/use_cases/categories_use_case.dart'
    as _i332;
import '../../features/main_layout/domain/use_cases/products_use_case.dart'
    as _i131;
import '../../features/main_layout/domain/use_cases/sub_categories_use_case.dart'
    as _i373;
import '../../features/main_layout/presentation/screens/tabs/categories/cubit/sub_category_cubit.dart'
    as _i911;
import '../../features/main_layout/presentation/screens/tabs/home/cubit/home_cubit.dart'
    as _i257;
import '../../features/network/api_client/api_client.dart' as _i652;
import '../utils/error_handler.dart' as _i383;
import '../utils/shared_prefs_utils.dart' as _i652;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItModule = _$GetItModule();
    gh.factory<_i383.ErrorHandler>(() => _i383.ErrorHandler());
    gh.factory<_i652.SharedPrefsUtils>(() => _i652.SharedPrefsUtils());
    gh.singleton<_i895.Connectivity>(() => getItModule.getConnectivity());
    gh.singleton<_i361.Dio>(() => getItModule.getDio());
    gh.singleton<_i652.ApiClient>(() => _i652.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i239.HomeRemoteDataSource>(() => _i26.HomeRemoteDataSourceImpl(
          gh<_i652.ApiClient>(),
          gh<_i383.ErrorHandler>(),
        ));
    gh.factory<_i515.HomeRepo>(() => _i599.HomeRepoImpl(
          gh<_i239.HomeRemoteDataSource>(),
          gh<_i895.Connectivity>(),
        ));
    gh.factory<_i1071.RemoteCartDataSource>(
        () => _i85.RemoteCartDataSourceImpl(gh<_i652.ApiClient>()));
    gh.factory<_i332.CategoriesUseCase>(
        () => _i332.CategoriesUseCase(gh<_i515.HomeRepo>()));
    gh.factory<_i131.ProductsUseCase>(
        () => _i131.ProductsUseCase(gh<_i515.HomeRepo>()));
    gh.factory<_i373.SubCategoriesUseCase>(
        () => _i373.SubCategoriesUseCase(gh<_i515.HomeRepo>()));
    gh.factory<_i209.CartRepo>(() => _i582.CartRepoImpl(
          gh<_i1071.RemoteCartDataSource>(),
          gh<_i895.Connectivity>(),
        ));
    gh.factory<_i257.HomeCubit>(() => _i257.HomeCubit(
          gh<_i332.CategoriesUseCase>(),
          gh<_i131.ProductsUseCase>(),
        ));
    gh.factory<_i408.AuthRemoteDataSource>(
        () => _i1068.AuthRemoteDataSourceImpl(
              gh<_i652.ApiClient>(),
              gh<_i652.SharedPrefsUtils>(),
              gh<_i383.ErrorHandler>(),
            ));
    gh.factory<_i911.SubCategoryCubit>(
        () => _i911.SubCategoryCubit(gh<_i373.SubCategoriesUseCase>()));
    gh.factory<_i976.AuthRepo>(() => _i751.AuthRepoImpl(
          gh<_i895.Connectivity>(),
          gh<_i408.AuthRemoteDataSource>(),
        ));
    gh.factory<_i956.AddToCartUseCase>(
        () => _i956.AddToCartUseCase(gh<_i209.CartRepo>()));
    gh.factory<_i865.DeleteFromCartUseCase>(
        () => _i865.DeleteFromCartUseCase(gh<_i209.CartRepo>()));
    gh.factory<_i38.GetCartUseCase>(
        () => _i38.GetCartUseCase(gh<_i209.CartRepo>()));
    gh.factory<_i302.UpdateCartProductQuantityUseCase>(
        () => _i302.UpdateCartProductQuantityUseCase(gh<_i209.CartRepo>()));
    gh.factory<_i1038.LoginUseCase>(
        () => _i1038.LoginUseCase(gh<_i976.AuthRepo>()));
    gh.factory<_i1010.RegisterUseCase>(
        () => _i1010.RegisterUseCase(gh<_i976.AuthRepo>()));
    gh.factory<_i219.AuthCubit>(() => _i219.AuthCubit(
          gh<_i1038.LoginUseCase>(),
          gh<_i1010.RegisterUseCase>(),
        ));
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
