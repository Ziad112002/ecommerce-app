import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:ecommerce_app/features/network/models/request/register_request.dart';
import 'package:injectable/injectable.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@injectable
class AuthCubit extends Cubit<AuthState>{
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  AuthCubit(this._loginUseCase,this._registerUseCase):super(AuthState(loginApi: Resource.initial(),registerApi: Resource.initial()));
  Future<void>login(String email,String password)async{
    emit(state.copyWith(loginApi: Resource.loading()));
    var result=await _loginUseCase(LoginRequest(email: email, password: password));
    if(result.isSuccess){
      emit(state.copyWith(loginApi: Resource.success(null)));
    }else{
      emit(state.copyWith(loginApi: Resource.error(result.getError.errorMessage)));
    }
  }
  Future<void>register(String name,String phone,String rePassword,String email,String password)async{
    emit(state.copyWith(registerApi: Resource.loading()));
    var result=await _registerUseCase(RegisterRequest(name: name, email: email, password: password, rePassword: rePassword, phone: phone));
    if(result.isSuccess){
      emit(state.copyWith(registerApi: Resource.success(null)));
    }else{
      emit(state.copyWith(registerApi: Resource.error(result.getError.errorMessage)));
    }
  }

}