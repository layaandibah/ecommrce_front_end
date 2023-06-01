import 'package:ecommerce/binding.dart';
import 'package:ecommerce/core/localazation/changelocale.dart';
import 'package:ecommerce/core/localazation/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/screen/cart_screen.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializ();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  MyLocal controller =Get.put(MyLocal());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      translations: MyTranslation(),
      locale:controller.language,
      theme: controller.theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //home: Language(),
      initialBinding: MyBinding(),
      // routes: routes,
      getPages:routes,
      home:const CartScreen(),
    );
  }
}
