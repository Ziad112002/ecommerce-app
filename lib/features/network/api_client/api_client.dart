import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/network/models/request/login_request.dart';
import 'package:ecommerce_app/features/network/models/request/register_request.dart';
import 'package:ecommerce_app/features/network/models/response/auth_response.dart';
import 'package:ecommerce_app/features/network/models/response/category/category_response.dart';
import 'package:ecommerce_app/features/network/models/response/category/remote_category.dart';
import 'package:ecommerce_app/features/network/models/response/product/product_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @POST("/api/v1/auth/signin")
  Future<HttpResponse<AuthResponse>> login(@Body()LoginRequest request);
  @POST("/api/v1/auth/signup")
  Future<HttpResponse<AuthResponse>> register(@Body()RegisterRequest request);
@GET("/api/v1/categories")
  Future<HttpResponse<CategoryResponse>> getCategories();
@GET("/api/v1/products")
  Future<HttpResponse<ProductResponse>> getProducts();
@GET("/api/v1/categories/{categoryId}/subcategories")
  Future<HttpResponse<CategoryResponse>> getSubCategory(@Path() String categoryId);
}
