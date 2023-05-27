import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumButtonLanguage  extends StatelessWidget{
  const CustumButtonLanguage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(
            horizontal: 70, vertical: 5),
        onPressed: () {
         Get.toNamed("/onboarding");
        },
        color: AppColor.primarycolor,
        child: Text(
          "4".tr,
          style: TextStyle(color: Colors.white,fontSize: 16),),

      ),
    );
  }
}
