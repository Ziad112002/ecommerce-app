import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocBuilder<CartCubit,CartState>(
          builder: (context,state) {
            if(state.cart==null||state.cart!.cartProducts.isEmpty){
              return Center(child: Text("No items in cart",style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),),);
            }else{
              var products=state.cart!.cartProducts.values.toList();
              CartCubit cartCubit=getIt();
            return Column(
              children: [
                Expanded(
                  // the list of cart items ===============
                  child: ListView.separated(
                    itemBuilder: (context, index) => CartItemWidget(
                      cartProduct: products[index],
                      onDeleteTap: () {
                        cartCubit.deleteFromCart(products[index].product!.id!);
                      },
                      onDecrementTap: (value) {
                        cartCubit.updateCartProductQuantity(products[index].product!.id!,(products[index].count!-1).toInt());
                      },
                      onIncrementTap: (value) {
                        cartCubit.updateCartProductQuantity(products[index].product!.id!,(products[index].count!+1).toInt());

                      },
                      size: 40,
                      color: Colors.black,
                      colorName: 'Black',
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: products.length,
                  ),
                ),
                // the total price and checkout button========
                TotalPriceAndCheckoutBotton(
                  totalPrice: state.cart?.totalCartPrice??0.0,
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            );

            }

          }
        ),
      ),
    );
  }
}
