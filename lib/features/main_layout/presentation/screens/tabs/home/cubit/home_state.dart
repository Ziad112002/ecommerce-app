import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';

class HomeState {
  late Resource<List<Category>> categoriesApi;
  late Resource<List<Product>> productsApi;
  HomeState({required this.categoriesApi,required this.productsApi});
  HomeState.initial(){
    categoriesApi=Resource.initial();
    productsApi=Resource.initial();

  }
  HomeState copyWith({
    Resource<List<Category>>? categoriesApi,
    Resource<List<Product>>? productsApi
}){
   return HomeState(categoriesApi: categoriesApi??this.categoriesApi, productsApi: productsApi??this.productsApi);
  }

}