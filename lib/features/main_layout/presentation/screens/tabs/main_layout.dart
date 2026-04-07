import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/categories/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/favourite/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/home/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/main_layout/presentation/screens/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/presentation/screens/cubit/cart_cubit.dart';
import 'home/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];
     HomeCubit cubit=getIt<HomeCubit>();
  @override
  void initState() {
super.initState();
cubit.getCategories();
cubit.getProducts();
CartCubit cartCubit=getIt();
cartCubit.getCart();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>cubit,
      child: Scaffold(
        appBar: const HomeScreenAppBar(),
        extendBody: false,
        body: tabs[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: SizedOverflowBox(
            size: Size(double.infinity, MediaQuery.of(context).size.height*.1),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) => changeSelectedIndex(value),
              backgroundColor: ColorManager.primary,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.white,
              showSelectedLabels: false, // Hide selected item labels
              showUnselectedLabels: false, // Hide unselected item labels
              items: [
                // Build BottomNavigationBarItem widgets for each tab
                CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager
                  .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
            ),
          ),
        );
}
