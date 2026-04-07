import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/network/models/response/category/category_response.dart';
import 'package:ecommerce_app/features/network/models/response/product/product_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/utils/error_handler.dart';
import '../../../../../network/api_client/api_client.dart';
import 'home_remote_data_source.dart';
@Injectable(as: HomeRemoteDataSource)
 class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiClient _apiClient;
  final ErrorHandler _errorHandler;
  HomeRemoteDataSourceImpl(this._apiClient,this._errorHandler);
  @override
  Future<ApiResult<CategoryResponse>>getCategories()async{
    try{
      var response=await _apiClient.getCategories();
      return SuccessApiResult(response.data);
    }on DioException catch(e){
      return ErrorApiResult(_errorHandler.handleError(e));
    }
    
  }
  @override
  Future<ApiResult<ProductResponse>>getProducts()async{
    try{
      var response=await _apiClient.getProducts();
      return SuccessApiResult(response.data);
    }on DioException catch(e){
      return ErrorApiResult(_errorHandler.handleError(e));
    }
  }
  @override
  Future<ApiResult<CategoryResponse>>getSubCategory(String categoryId)async{
    try{
      var response=await _apiClient.getSubCategory(categoryId);
      return SuccessApiResult(response.data);
    }on DioException catch(e){
      return ErrorApiResult(_errorHandler.handleError(e));
    }
  }
}