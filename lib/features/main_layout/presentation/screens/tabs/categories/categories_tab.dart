import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/cubit/sub_category_cubit.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_state.dart';
import 'cubit/sub_category_state.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selectedIndex = 0;
  final SubCategoryCubit _cubit = getIt();
  String categoryTitle = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state.categoriesApi.isSuccess && state.categoriesApi.data != null) {
          var categories = state.categoriesApi.data;
          _cubit.getSubCategories(categories![selectedIndex].id ?? "");
          categoryTitle = categories[selectedIndex].name ?? "";
          return Row(
            children: [
              CategoriesList(
                categories: categories ,
                selectedIndex: selectedIndex,
                onItemClick: changeSelectedIndex,
              ),
              SizedBox(
                width: AppSize.s16,
              ),
              BlocBuilder<SubCategoryCubit, SubCategoryState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state.subCategoriesApi.isSuccess &&
                        state.subCategoriesApi.data != null) {
                      var subCategories = state.subCategoriesApi.data;
                      return SubCategoriesList(
                        categoryTitle: categoryTitle,
                        subCategories: subCategories??[],
                      );
                    } else if (state.subCategoriesApi.isError) {
                      return Center(
                          child: Text(state.subCategoriesApi.errorMessage ?? "",
                              style: getRegularStyle(
                                  color: ColorManager.error, fontSize: 16.sp)));
                    } else {
                      return Expanded(
                        flex: 2,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        )),
                      );
                    }
                  })
            ],
          );
        } else if (state.categoriesApi.isError) {
          return Center(
              child: Text(state.categoriesApi.errorMessage ?? "",
                  style: getRegularStyle(
                      color: ColorManager.error, fontSize: 16.sp)));
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: ColorManager.primary,
          ));
        }
      }),
    );
  }

  void changeSelectedIndex(int index,) {
    setState(() {
      selectedIndex = index;
    });
  }
}
