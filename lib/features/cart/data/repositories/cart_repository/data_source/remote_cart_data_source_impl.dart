import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/core/utils/error_handler.dart';
import 'package:ecommerce_app/features/cart/data/models/remote_cart.dart';
import 'package:ecommerce_app/features/cart/data/repositories/cart_repository/data_source/remote_cart_data_source.dart';
import 'package:ecommerce_app/features/network/models/request/add_to_cart_request.dart';
import 'package:ecommerce_app/features/network/models/request/update_product_request.dart';
import 'package:injectable/injectable.dart';
import '../../../../../network/api_client/api_client.dart';
@Injectable(as: RemoteCartDataSource)
class RemoteCartDataSourceImpl extends RemoteCartDataSource{
  final ApiClient _apiClient;
  RemoteCartDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<RemoteCart>> addToCart(String productId) async{
    try {
         await _apiClient.addToCart(AddToCartRequest(productId: productId));
      return getCart();
    } on DioException catch (e) {
      return ErrorApiResult(ErrorHandler().handleError(e));
    }

  }
  @override
  Future<ApiResult<RemoteCart>> updateCartProductQuantity(String productId,int count) async{
    try {
      var response=await _apiClient.updateProductCartQuantity(productId, UpdateProductRequest(count: count));
      return SuccessApiResult(response.data.cart);
    } on DioException catch (e) {
      return ErrorApiResult(ErrorHandler().handleError(e));
    }
  }


  @override
  Future<ApiResult<RemoteCart>> getCart()async {
    try {
      var response= await _apiClient.getCart();
      return SuccessApiResult(response.data.cart);
    } on DioException catch (e) {
      return ErrorApiResult(ErrorHandler().handleError(e));
    }
  }


  @override
  Future<ApiResult<RemoteCart>> deleteFromCart(String productId) async{
    try {
     var response= await _apiClient.deleteFromCart(productId);
      return SuccessApiResult(response.data.cart);
    } on DioException catch (e) {
      return ErrorApiResult(ErrorHandler().handleError(e));
    }

  }

}