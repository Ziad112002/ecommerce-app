import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/cart/domain/models/cart_product.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartProduct,
    required this.color,
    required this.colorName,
    required this.size,
    required this.onDeleteTap,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });

  final Color color;
  final String colorName;
  final int size;
  final CartProduct cartProduct;
  final void Function() onDeleteTap;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withAlpha(77)),
        ),
        child: Row(children: [
          // display image in the container
          InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.productDetails),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: ColorManager.primary.withAlpha(77)),
              ),
              child: CachedNetworkImage(
                  imageUrl: cartProduct.product?.imageCover??"",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
              ),
            ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          cartProduct.product?.title??"",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onDeleteTap,
                        child: Image.asset(
                          IconsAssets.icDelete,
                          color: ColorManager.textColor,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),

                  // SizedBox(height: 7.h),
                  const Spacer(),
                  // display color and size===================
                  ColorAndSizeCartItem(
                    color: color,
                    colorName: colorName,
                    size: size,
                  ),
                  const Spacer(),
                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${cartProduct.price??""}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                      ProductCounter(
                        add: onIncrementTap,
                        productCounter: (cartProduct.count)?.toInt()??0,
                        remove: onDecrementTap,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),

    );
  }
}
