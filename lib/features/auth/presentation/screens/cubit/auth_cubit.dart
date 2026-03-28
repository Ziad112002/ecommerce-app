import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:injectable/injectable.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@injectable
class AuthCubit extends Cubit<AuthState>{
  final LoginUseCase _loginUseCase;
  AuthCubit(this._loginUseCase):super(AuthState(Resource.initial()));
  Future<void>login(String email,String password)async{
    emit(AuthState(Resource.loading()));
    var result=await _loginUseCase(LoginRequest(email: email, password: password));
    if(result.isSuccess){
      emit(AuthState(Resource.success(null)));
    }else{
      emit(AuthState(Resource.error(result.getError.errorMessage)));
    }
  }

}