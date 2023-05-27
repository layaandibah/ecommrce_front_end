import 'dart:ui';

import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal  extends GetxController{
  Locale? language;
  ThemeData theme=themeEnglish;
  MyServices services=Get.find();
  changelocale(String code)
  {
    Locale locale=Locale(code);
    code=="ar"?theme=themeArabic:theme=themeEnglish;
    services.sharedPreferences.setString("lang", code);
    Get.updateLocale(locale);
  }

 @override
  void onInit() {
   String? lang= services.sharedPreferences.getString("lang");
   if(lang=="ar"){
     theme=themeArabic;
     language=const Locale("ar");
   }
   else if(lang=="en"){
     theme=themeEnglish;

     language=const Locale("en");
   }else {
     theme=themeEnglish;
     language=Get.deviceLocale;
   }
    super.onInit();
  }
}