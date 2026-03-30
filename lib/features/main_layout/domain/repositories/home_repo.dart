import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>>getCategories();
  Future<ApiResult<List<Product>>>getProducts();
  Future<ApiResult<List<Category>>>getSubCategory(String categoryId);
}