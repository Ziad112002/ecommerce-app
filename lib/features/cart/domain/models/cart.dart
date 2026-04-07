
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';


class Cart {
  Map<String, Product> cartProducts;
  double totalCartPrice;
  Cart(this.cartProducts,this.totalCartPrice);
}