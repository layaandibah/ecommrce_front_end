import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware{
   @override
   int? priority = 1;
   MyServices myServices=Get.find();
   @override
   RouteSettings?  redirect(String? route) {

     if(myServices.sharedPreferences.getString("onboarding")=="done"){
      return RouteSettings(name:AppRoutes.login );
     }

   }

}
