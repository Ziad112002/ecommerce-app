import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:injectable/injectable.dart';
@injectable
class ErrorHandler {
   AppErrors handleError(DioException e){
    int? statusCode=e.response?.statusCode;
    switch(statusCode){
      case 400 :
        return UnKnownErrors(errorMessage: "Invalid request.Please check your input.");
      case 401:
        return UnKnownErrors(errorMessage: "Invalid email or password");
      case 409:
        return UnKnownErrors(errorMessage: "Account already exists");
      case 500:
        return ServerErrors();
      default:
        return UnKnownErrors();
    }

  }
}