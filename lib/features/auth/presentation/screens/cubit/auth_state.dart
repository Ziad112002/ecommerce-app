import 'package:ecommerce_app/core/utils/resource.dart';

class AuthState {
  late Resource<void>loginApi;
  AuthState(this.loginApi);
  AuthState.initial(){
    loginApi = Resource.initial();
  }
}