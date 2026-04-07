import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/core/utils/app_errors.dart';
import 'package:ecommerce_app/core/utils/extensions/connectivity_extension.dart';
import 'package:ecommerce_app/features/main_layout/data/mappers/category_mapper.dart';
import 'package:ecommerce_app/features/main_layout/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'data_sources/home_remote_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final Connectivity _connectivity;
  final HomeRemoteDataSource _remoteDataSource;
  HomeRepoImpl(this._remoteDataSource, this._connectivity);
  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    if (await _connectivity.isConnected) {
      var apiResult = await _remoteDataSource.getCategories();
      if (apiResult.isSuccess) {
        var categories = apiResult.getData?.data
                ?.map((remoteCategory) => remoteCategory.toCategory())
                .toList() ??
            [];
        return SuccessApiResult(categories);
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }

  @override
  Future<ApiResult<List<Product>>> getProducts() async {
    if (await _connectivity.isConnected) {
      var apiResult = await _remoteDataSource.getProducts();
      if (apiResult.isSuccess) {
        var products = apiResult.getData?.data
                ?.map((remoteProduct) => remoteProduct.toProduct())
                .toList() ??
            [];
        return SuccessApiResult(products);
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }

  @override
  Future<ApiResult<List<Category>>> getSubCategory(String categoryId) async {
    if (await _connectivity.isConnected) {
      var apiResult = await _remoteDataSource.getSubCategory(categoryId);
      if (apiResult.isSuccess) {
        var subCategories = apiResult.getData?.data
                ?.map((remoteCategory) => remoteCategory.toCategory())
                .toList() ??
            [];
        return SuccessApiResult(subCategories);
      } else {
        return ErrorApiResult(apiResult.getError);
      }
    } else {
      return ErrorApiResult(NetworkErrors());
    }
  }
}
