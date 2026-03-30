import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsUseCase {
  final HomeRepo _homeRepo;
  ProductsUseCase(this._homeRepo);
  Future<ApiResult<List<Product>>>call()async{
    return await _homeRepo.getProducts();
  }
}