import 'package:ecommerce/controller/auth/successsignup_controller.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller=Get.put(SuccessSignUpControllerImp());
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Expanded(flex: 3,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.successimagesignup,height: 350,),
            SizedBox(height: 1,),

            Text("41".tr,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.primarycolor,fontSize: 30),),
            Text("....",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.primarycolor,fontSize: 30),),
  CustomTextBodyAuth(text: "38".tr)
          ],
        )),

 Container(
     width: double.infinity,
     margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
     child: CustomButtonAuth(onPressed: (){
       controller.goToLogIn();
     }, text:"11".tr))
      ],),
    ),);
  }
}
