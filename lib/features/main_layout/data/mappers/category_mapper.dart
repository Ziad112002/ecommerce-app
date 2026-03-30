import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/network/models/response/category/remote_category.dart';

extension CategoryMapper on RemoteCategory {
  Category toCategory() => Category(
        id: id ?? "",
        name: name ?? "",
        categoryId: categoryId ?? "",
        image: image ?? "",
      );

}
