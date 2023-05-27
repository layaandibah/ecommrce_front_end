import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumButtonOnboarding  extends GetView<OnBoardingControllerImp> {
  const CustumButtonOnboarding ({Key? key}) : super(key: key);

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
            controller.next();
          },
          color: AppColor.primarycolor,
        child: Text("11".tr,
          style: TextStyle(color: Colors.white,fontSize: 16),),

      ),
    );
  }
}
