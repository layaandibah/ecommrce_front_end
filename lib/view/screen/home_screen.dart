import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller=Get.put(HomePageControllerImp());

    return Scaffold(appBar: AppBar(title: Text("title"),),
    body: Center(child: Text("${controller.username}"),),);
  }
}
