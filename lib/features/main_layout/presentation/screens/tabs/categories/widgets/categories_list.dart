import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/widgets/category_item.dart';
import 'package:flutter/material.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key,required this.onItemClick,required this.categories,required this.selectedIndex});
  final List<Category> categories;
  final Function onItemClick;
  final int selectedIndex ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withAlpha(76)),
            left: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withAlpha(76)),
            bottom: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withAlpha(76))),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
      ),

      // the categories items list
      child: ClipRRect(
        // clip the corners of the container that hold the list view
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
        child:   ListView.builder(
      itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItem(index,
            categories[index].name??"", selectedIndex == index, onItemClick),
      ),
      ),
    ));
  }
}
