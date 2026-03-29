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
    gh.factory<_i408.AuthRemoteDataSource>(
        () => _i1068.AuthRemoteDataSourceImpl(
              gh<_i652.ApiClient>(),
              gh<_i652.SharedPrefsUtils>(),
              gh<_i383.ErrorHandler>(),
            ));
    gh.factory<_i976.AuthRepo>(() => _i751.AuthRepoImpl(
          gh<_i895.Connectivity>(),
          gh<_i408.AuthRemoteDataSource>(),
        ));
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
