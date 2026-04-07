import 'package:ecommerce_app/features/cart/data/models/remote_cart.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart.dart';
import 'package:ecommerce_app/features/main_layout/data/mappers/product_mapper.dart';
import '../../../main_layout/domain/models/product.dart';
import '../models/renote_cart_products.dart';

extension CartMapper on RemoteCart{
  Cart toCart() {
    List<RemoteCartProducts> cartProducts = products ?? [];
    Map<String, Product> map = {};
    for (var remoteCartProduct in cartProducts) {
      if (remoteCartProduct.product?.id != null){
        map.addAll({
          remoteCartProduct.product!.id!: remoteCartProduct.product!.toProduct()
        });
      }
    }
    return Cart(map, totalCartPrice?.toDouble() ?? 0.0);
  }

}