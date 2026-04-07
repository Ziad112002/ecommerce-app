import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';

class CartProduct {
  num? count;
  String? id;
  Product? product;
  num? price;
  CartProduct(this.count,this.id,this.product,this.price);
}