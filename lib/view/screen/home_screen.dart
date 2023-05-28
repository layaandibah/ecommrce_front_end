<<<<<<< HEAD
import 'package:ecommerce/core/constant/color.dart';
=======
import 'package:ecommerce/controller/homepage_controller.dart';
>>>>>>> 25463791f6c2ded652690211caa7bcc8996fd7db
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/homepage/customdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title:const Text("title"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      drawer: CustomDrawer(),
    );
=======
    HomePageControllerImp controller=Get.put(HomePageControllerImp());

    return Scaffold(appBar: AppBar(title: Text("title"),),
    body: Center(child: Text("${controller.username}"),),);
>>>>>>> 25463791f6c2ded652690211caa7bcc8996fd7db
  }
}
