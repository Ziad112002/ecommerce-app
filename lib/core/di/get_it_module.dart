import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/constants_manager.dart';


@module
abstract class GetItModule {
  @singleton
  Connectivity getConnectivity() => Connectivity();
  @singleton
  Dio getDio() {
    Dio dio=Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
    dio.interceptors.add(PrettyDioLogger());//Print all requests or responses from the device to the servers or vice versa
    return dio;

  }
}
