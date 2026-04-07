import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/font_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/category.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key,required this.categoryTitle,required this.subCategories});
final String categoryTitle;
final List<Category> subCategories;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              categoryTitle,
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem(categoryTitle,
                ImageAssets.categoryCardImage, goToCategoryProductsListScreen),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: subCategories.length,
                (context, index) => SubCategoryItem(
                    subCategories[index].name??"",
                    ImageAssets.subcategoryCardImage,
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: AppSize.s8,
                crossAxisSpacing: AppSize.s8,
              ))
        ],
      ),
    );
  }

  void goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
