import 'package:ecommerce_app/features/cart/domain/models/cart_product.dart';
import 'package:ecommerce_app/features/main_layout/data/mappers/product_mapper.dart';

import '../../../network/models/response/product/remote_product.dart';

class RemoteCartProducts {
  RemoteCartProducts({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  RemoteCartProducts.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? RemoteProduct.fromJson(json['product'])
        : null;
    price = json['price'];
  }
  num? count;
  String? id;
  RemoteProduct? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }
  CartProduct toCartProduct() {
    return CartProduct(count, id, product?.toProduct(), price);
  }
}
