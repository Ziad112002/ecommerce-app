import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_cases/sub_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/cubit/sub_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SubCategoryCubit extends Cubit<SubCategoryState>{
  final SubCategoriesUseCase _useCase;
  SubCategoryCubit(this._useCase):super(SubCategoryState(Resource.initial()));
  Future<void>getSubCategories(String categoryId)async{
    emit(SubCategoryState(Resource.loading()));
    final result =await _useCase(categoryId);
    if(result.isSuccess){
      emit(SubCategoryState(Resource.success(result.getData)));
    }else{
      emit(SubCategoryState(Resource.error(result.getError.errorMessage)));
    }
  }
}