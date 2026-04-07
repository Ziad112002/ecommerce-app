import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cubit/cart_state.dart';
import 'package:ecommerce_app/features/main_layout/domain/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  const ProductCard({
    super.key,

    required this.product,
  });
  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 4) {
      return title;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 200.w,
      height: 280.h,
      child: Container(
        width: 280,
        margin: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: ColorManager.primary.withAlpha(204),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover ?? "",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(product.title??""),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                        color: ColorManager.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      truncateTitle(product.description??""),
                      maxLines: 1,
                      style: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${product.price??""}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "${product.priceAfterDiscount??0} EGP ",
                          style: getTextWithLine(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Reviews",
                              style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "${product.ratingsAverage??0}",
                              style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        productActionButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productActionButton() {
    CartCubit cart =getIt();
    return BlocBuilder<CartCubit,CartState>(
      builder: (context,state) {
        return InkWell(
                            onTap: () {
                              cart.isProductInCart(product.id!)?
                              cart.deleteFromCart(product.id!):cart.addToCart(product.id!);
                            },
                            child: Icon(
                             cart.isProductInCart(product.id!)? Icons.remove_circle_rounded:Icons.add_circle_rounded,
                              color: ColorManager.primary,
                              size: 36,
                            ),
                          );
      }
    );
  }
}
