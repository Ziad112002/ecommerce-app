import 'package:ecommerce_app/core/utils/app_errors.dart';

sealed class ApiResult<T> {
  bool get isSuccess=>this is SuccessApiResult;
  bool get isError=>this is ErrorApiResult;
  AppErrors get getError=> (this as ErrorApiResult).error;
T? get getData=>(this as SuccessApiResult<T>).data;

}
class SuccessApiResult<T>extends ApiResult<T>{
  T? data;
  SuccessApiResult(this.data);
}class ErrorApiResult<T>extends ApiResult<T>{
  AppErrors error;
  ErrorApiResult(this.error);
}