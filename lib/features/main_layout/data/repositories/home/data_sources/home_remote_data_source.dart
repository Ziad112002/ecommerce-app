import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/network/models/response/category/category_response.dart';
import 'package:ecommerce_app/features/network/models/response/product/product_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<CategoryResponse>>getCategories();
  Future<ApiResult<ProductResponse>>getProducts();
  Future<ApiResult<CategoryResponse>>getSubCategory(String categoryId);
}