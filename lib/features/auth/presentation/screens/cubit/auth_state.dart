import 'package:ecommerce_app/core/utils/resource.dart';

class AuthState {
  late Resource<void>loginApi;
  late Resource<void>registerApi;
  AuthState({required this.loginApi,required this.registerApi});
  AuthState.initial(){
    loginApi = Resource.initial();
    registerApi = Resource.initial();
  }
  AuthState copyWith({
    Resource<void>?loginApi,
     Resource<void>?registerApi
}){
    return AuthState(
      loginApi:loginApi??this.loginApi,
     registerApi:  registerApi??this.registerApi,
    );
  }
}