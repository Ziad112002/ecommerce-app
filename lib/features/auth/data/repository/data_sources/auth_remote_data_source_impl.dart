import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/core/utils/shared_prefs_utils.dart';
import 'package:ecommerce_app/features/auth/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/network/api_client/api_client.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:ecommerce_app/features/network/models/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/error_handler.dart';
import '../../../../network/models/request/register_request.dart';
@Injectable(as: AuthRemoteDataSource)
 class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final  ApiClient _apiClient;
  final SharedPrefsUtils _sharedPrefsUtils;
  final ErrorHandler _errorHandler;
  AuthRemoteDataSourceImpl(this._apiClient,this._sharedPrefsUtils, this._errorHandler );
  @override
  Future<ApiResult<AuthResponse>>login(LoginRequest request)async{
    try{
      var response=await _apiClient.login(request);
      _sharedPrefsUtils.saveToken(response.data.token);
        return SuccessApiResult(response.data);
    }on DioException catch (e){
      return ErrorApiResult(_errorHandler.handleError(e));    }
  }
  @override
  Future<ApiResult<AuthResponse>>register(RegisterRequest request)async{
    try{
      var response=await _apiClient.register(request);
      _sharedPrefsUtils.saveToken(response.data.token);
      return SuccessApiResult(response.data);
    }on DioException catch(e){
      return ErrorApiResult(_errorHandler.handleError(e));
    }
  }
}