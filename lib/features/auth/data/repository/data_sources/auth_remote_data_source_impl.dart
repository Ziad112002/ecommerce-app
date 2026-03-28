import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:ecommerce_app/features/auth/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/network/api_client/api_client.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:ecommerce_app/features/network/models/response/auth_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../network/models/request/register_request.dart';
@Injectable(as: AuthRemoteDataSource)
 class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final  ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<AuthResponse>>login(LoginRequest request)async{
    try{
      var response=await _apiClient.login(request);
      return SuccessApiResult(response);
    }catch(e){
      return ErrorApiResult(UnKnownErrors(errorMessage: e.toString()));
    }
  }
  @override
  Future<ApiResult<AuthResponse>>register(RegisterRequest request)async{
    try{
      var response=await _apiClient.register(request);
      return SuccessApiResult(response);
    }catch(e){
      return ErrorApiResult(UnKnownErrors(errorMessage: e.toString()));
    }
  }
}