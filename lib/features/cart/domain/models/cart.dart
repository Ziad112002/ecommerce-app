
import 'package:ecommerce_app/features/cart/domain/models/cart_product.dart';


class Cart {
  Map<String, CartProduct> cartProducts;
  double totalCartPrice;
  Cart(this.cartProducts,this.totalCartPrice);
}