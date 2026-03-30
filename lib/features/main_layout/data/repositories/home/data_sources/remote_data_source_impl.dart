import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:ecommerce_app/features/network/models/response/category/category_response.dart';
import 'package:ecommerce_app/features/network/models/response/product/product_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../../network/api_client/api_client.dart';
import 'remote_data_source.dart';
@Injectable(as: RemoteDataSource)
 class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _apiClient;
  RemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<CategoryResponse>>getCategories()async{
    try{
      var response=await _apiClient.getCategories();
      return SuccessApiResult(response.data);
    }catch(e){
      return ErrorApiResult(UnKnownErrors());
    }
    
  }
  @override
  Future<ApiResult<ProductResponse>>getProducts()async{
    try{
      var response=await _apiClient.getProducts();
      return SuccessApiResult(response.data);
    }catch(e){
      return ErrorApiResult(UnKnownErrors());
    }
  }
  @override
  Future<ApiResult<CategoryResponse>>getSubCategory(String categoryId)async{
    try{
      var response=await _apiClient.getSubCategory(categoryId);
      return SuccessApiResult(response.data);
    }catch(e){
      return ErrorApiResult(UnKnownErrors());
    }
  }
}