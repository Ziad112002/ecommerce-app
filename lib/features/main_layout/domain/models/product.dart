class Product {
  final String? id;
  final String? title;
  final String? description;
  final num? price;
  final num? priceAfterDiscount;
  final String? imageCover;
  final List<String>? images;
  final String? categoryId;
  final String? brandId;
  final num? ratingsAverage;
  final num? ratingsQuantity;
  final num? quantity;
  final List<String>? availableColors;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.images,
    this.categoryId,
    this.brandId,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.quantity,
    this.availableColors,
  });
}