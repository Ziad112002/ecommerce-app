import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_cases/categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/domain/use_cases/products_use_case.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  final CategoriesUseCase _categoriesUseCase;
  final ProductsUseCase _productsUseCase;
  HomeCubit(this._categoriesUseCase, this._productsUseCase)
      : super(HomeState(
            categoriesApi: Resource.initial(),
            productsApi: Resource.initial()));
  Future<void>getCategories() async {
    emit(state.copyWith(categoriesApi: Resource.loading()));
    var result = await _categoriesUseCase();
    if(result.isSuccess){
      emit(state.copyWith(categoriesApi: Resource.success(result.getData)));
    }else{
        emit(state.copyWith(categoriesApi: Resource.error(result.getError.errorMessage)));
    }
  }
  Future<void>getProducts() async {
    emit(state.copyWith(productsApi: Resource.loading()));
    var result = await _productsUseCase();
    if(result.isSuccess){
      emit(state.copyWith(productsApi: Resource.success(result.getData)));
    }else{
        emit(state.copyWith(productsApi: Resource.error(result.getError.errorMessage)));
    }
  }
}
