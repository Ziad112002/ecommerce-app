import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:ecommerce_app/core/utils/extensions/connectivity_extension.dart';
import 'package:ecommerce_app/features/auth/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/api_result.dart';
import '../../../network/models/request/login_request.dart';
import '../../../network/models/request/register_request.dart';
@Injectable(as:AuthRepo)
class AuthRepoImpl extends AuthRepo{
  final Connectivity _connectivity;
  final AuthRemoteDataSource _dataSource;
  AuthRepoImpl(this._connectivity,this._dataSource);
  @override
  Future<ApiResult<void>>login(LoginRequest request)async{
   if(await _connectivity.isConnected){
     try{
       var result= await _dataSource.login(request);
       return result;

     }catch(e){
       return ErrorApiResult(UnKnownErrors(errorMessage: e.toString()));
     }
   }else{
     return ErrorApiResult(NetworkErrors());
   }
  }
  @override
  Future<ApiResult<void>>register(RegisterRequest request)async{
    if(await _connectivity.isConnected){
      try{
        var result= await _dataSource.register(request);
        return result;

      }catch(e){
        return ErrorApiResult(UnKnownErrors(errorMessage: e.toString()));
      }
    }else{
      return ErrorApiResult(NetworkErrors());
    }
  }
}