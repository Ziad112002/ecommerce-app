import 'package:ecommerce_app/features/cart/domain/models/cart.dart';
import '../../../../core/utils/api_result.dart';

abstract class CartRepo {
  Future<ApiResult<Cart>> addToCart(String productId);
  Future<ApiResult<Cart>>updateCartProductQuantity(String productId,int count);
  Future<ApiResult<Cart>> getCart();
  Future<ApiResult<Cart>> deleteFromCart(String productId);
}