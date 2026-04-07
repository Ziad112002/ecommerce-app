import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart.dart';

class CartState {
  Cart? cart;
  late Resource<Cart> cartApi;
  CartState({this.cart, required this.cartApi});
  CartState.initial() : cartApi = Resource.initial();
  CartState copyWith({Cart? cart, Resource<Cart>? cartApi}) =>
      CartState(cart: cart ?? this.cart, cartApi: cartApi ?? this.cartApi);
}
