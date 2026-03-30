import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';
import 'package:ecommerce_app/features/network/models/response/product/remote_product.dart';
extension ProductMapper on RemoteProduct{
  Product toProduct()=>Product(
    id: id,
    title: title,
    availableColors: [],
    brandId: brand?.id,
    categoryId: category?.id,
    description: description,
    imageCover: imageCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    ratingsAverage: ratingsAverage,
    ratingsQuantity: ratingsQuantity,
  );
}