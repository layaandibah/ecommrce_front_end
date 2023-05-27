
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localazation/changelocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<MyLocal> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,
                style: TextStyle(
                    fontSize: 30,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            MaterialButton(padding: EdgeInsets.symmetric(horizontal: 85),
                color: AppColor.primarycolor,
                child: Text("2".tr,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  controller.changelocale("ar");
                }),
            MaterialButton(padding: EdgeInsets.symmetric(horizontal: 80,),
                color: AppColor.primarycolor,
                child: Text(
                  "3".tr,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  controller.changelocale("en");
                }),
            SizedBox(height: 100,),
            MaterialButton(padding: EdgeInsets.symmetric(horizontal: 80,),
                color: AppColor.primarycolor,
                child: Text(
                  "4".tr,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                Get.offNamed(AppRoutes.onboarding);
                })
          ],
        ),
      ),
    );
  }
}
