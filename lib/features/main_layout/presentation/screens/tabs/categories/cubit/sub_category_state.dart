import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';

import '../../../../../../../core/utils/resource.dart';

class  SubCategoryState{
  late Resource<List<Category>> subCategoriesApi;
  SubCategoryState(this.subCategoriesApi);
SubCategoryState.initial(){
  subCategoriesApi=Resource.initial();
}

}