import 'dart:async';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/styles_manager.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/home/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/home/cubit/home_state.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/home/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/widget/product_card.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          Column(
            children: [
              CustomSectionBar(sectionNname: 'Categories', function: () {}),
              SizedBox(
                height: 270.h,
                child: BlocBuilder<HomeCubit,HomeState>(
                  builder: (context,state){
                    if(state.categoriesApi.isSuccess&&state.categoriesApi.data!=null){
                      var categories=state.categoriesApi.data;
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  CustomCategoryWidget(
                            category: categories[index],
                          );
                        },
                        itemCount: categories!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
                    }else if(state.categoriesApi.isError){
                      return Center(child: Text(state.categoriesApi.errorMessage??"",style:getRegularStyle(color:ColorManager.error,fontSize:16.sp)));
                  }else{
                      return  Center(child: CircularProgressIndicator(color: ColorManager.primary ,));
                    }
                    }
                ),
              ),
              SizedBox(height: 12.h),
              CustomSectionBar(
                sectionNname: 'Products',
                function: () {},
              ),
              SizedBox(
                child: SizedBox(
                  height: 360.h,
                  child: BlocBuilder<HomeCubit,HomeState>(
                    builder: (context,state) {
                      if(state.productsApi.isSuccess&&state.productsApi.data!=null){
                        var products= state.productsApi.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return  ProductCard(
                              product: products[index],
                            );
                          },
                          itemCount: products!.length,
                        );
                      }else if(state.productsApi.isError){
                        return Center(child: Text(state.productsApi.errorMessage??"",style:getRegularStyle(color:ColorManager.error,fontSize:16.sp)));
                      }else{
                        return  Center(child: CircularProgressIndicator(color: ColorManager.primary ,));
                      }

                    }
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          )
        ],
      ),
    );
  }
}
