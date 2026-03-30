import 'package:ecommerce_app/core/utils/api_result.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SubCategoriesUseCase {
  final HomeRepo _homeRepo;
  SubCategoriesUseCase(this._homeRepo);
  Future<ApiResult<List<Category>>>call(String categoryId)async{
    return await _homeRepo.getSubCategory(categoryId);
  }
}