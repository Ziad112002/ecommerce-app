import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "token": SharedPrefsUtils().getToken(),
    });
    super.onRequest(options, handler);
  }
}
