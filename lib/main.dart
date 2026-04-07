import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/shared_prefs_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/screens/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes_manager/route_generator.dart';

void main() async{
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn=(await getIt<SharedPrefsUtils>().getToken())?.isNotEmpty??false;
  runApp( BlocProvider(
    create: (_)=>getIt<CartCubit>(),
      child: MainApp(isLoggedIn: isLoggedIn,)));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
   const MainApp({super.key,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: isLoggedIn?Routes.mainRoute:Routes.signInRoute,
      ),
    );
  }
}
