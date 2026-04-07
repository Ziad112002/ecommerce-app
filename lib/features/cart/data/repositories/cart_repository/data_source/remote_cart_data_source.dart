import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/cart/data/models/remote_cart.dart';

abstract class RemoteCartDataSource {
 Future<ApiResult<RemoteCart>> addToCart(String productId);
 Future<ApiResult<RemoteCart>>updateCartProductQuantity(String productId,int count);
 Future<ApiResult<RemoteCart>> getCart();
 Future<ApiResult<RemoteCart>> deleteFromCart(String productId);
}