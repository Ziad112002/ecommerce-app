import 'package:ecommerce_app/core/utils/app_errors.dart';

sealed class ApiResult<T> {
  bool get isSuccess=>this is SuccessApiResult;
  bool get isError=>this is ErrorApiResult;
}
class SuccessApiResult<T>extends ApiResult<T>{
  T data;
  SuccessApiResult(this.data);
}class ErrorApiResult<T>extends ApiResult<T>{
  AppErrors error;
  ErrorApiResult(this.error);
}