import 'package:ecommerce/core/middelware/mymiddleware.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';

import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/items_screen.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:get/get.dart';


import 'view/screen/auth/signup.dart';

List<GetPage<dynamic>>? routes=[
  GetPage(name: "/", page:()=>HomePage() ),

  // GetPage(name: "/", page:()=>Language(),middlewares: [
  //   MyMiddleWare(),
  // ] ),
  //
  GetPage(name: AppRoutes.login, page:()=>Login() ),
  GetPage(name: AppRoutes.signup , page:()=>SignUp() ),
  GetPage(name: AppRoutes.verifycode, page:()=>VerifyCode() ),
  GetPage(name: AppRoutes.forgetpassword, page:()=>ForgetPassword() ),
  GetPage(name: AppRoutes.resetpassword, page:()=>ResetPassword() ),
  GetPage(name: AppRoutes.successresetpassword, page:()=>SuccessResetPassword() ),
  GetPage(name: AppRoutes.successsignup, page:()=>SuccessSignUp() ),
  GetPage(name: AppRoutes.verifycodesignup, page:()=>VerifyCodeSignUp() ),
  //onboarding
  GetPage(name: AppRoutes.onboarding, page:()=>OnBoarding() ),
  //Home
  GetPage(name: AppRoutes.homepage, page:()=>HomePage() ),
  //items
  GetPage(name: AppRoutes.itemsscreen, page:()=>ItemsScreen() ),



];
// Map<String, Widget Function(BuildContext)> routtes = {
//   //Auth
//   AppRoutes.login:(context)=> Login(),
//   AppRoutes.signup:(context)=> SignUp(),
//   AppRoutes.verifycode:(context)=>VerifyCode(),
//   AppRoutes.forgetpassword:(context)=>ForgetPassword(),
//   AppRoutes.resetpassword:(context)=>ResetPassword(),
//   AppRoutes.successresetpassword:(context)=>SuccessResetPassword(),
//   AppRoutes.successsignup:(context)=>SuccessSignUp(),
//   AppRoutes.verifycodesignup:(context)=>VerifyCodeSignUp(),
//
//
//
//   //onBoarding
//   AppRoutes.onboarding:(context)=>OnBoarding(),
// };