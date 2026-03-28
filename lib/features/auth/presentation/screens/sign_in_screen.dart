import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/assets_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/resource.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import 'cubit/auth_state.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
 final AuthCubit _cubit=getIt();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      bloc: _cubit,
      listener: (context,state){
        final loginState=state.loginApi;
        if(loginState.isSuccess){
          Navigator.pushNamedAndRemoveUntil(context, Routes.mainRoute, (route) => false);

        }else if(loginState.status==AppStatus.error){
          Fluttertoast.showToast(
            msg:
            loginState.errorMessage ?? "Something went Wrong Pleas try again later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

        }

      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s24.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  BuildTextField(
                    controller: emailCtrl,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your name',
                    label: 'User name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                  ),
                  SizedBox(
                    height: AppSize.s28.h,
                  ),
                  BuildTextField(
                    controller: passwordCtrl,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s18.sp),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s60.h,
                  ),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        bloc: _cubit,
                        builder: (context,state) {
                          final loginState=state.loginApi;
                          if(!loginState.isLoading){
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary, fontSize: AppSize.s18),
                              onTap: () {
                              _cubit.login(emailCtrl.text, passwordCtrl.text);
                              },
                            );
                          }else{
                            return CircularProgressIndicator(
                              backgroundColor: ColorManager.white,
                            );
                          }

                        }
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        width: AppSize.s8.w,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
