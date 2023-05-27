
import 'package:ecommerce/controller/auth/verifycode_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';

import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';

import 'package:ecommerce/view/widget/auth/customtextformfaild.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  VerifyCode({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  // VerifyCodeControllerImp controller =Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.wightpurble,
        elevation: 0.0,
        // title: Text(
        //   "32".tr,
        //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //     fontSize: 18,
        //     color: AppColor.gray,
        //   ),
        // ),
      ),
      body:GetBuilder<VerifyCodeControllerImp>(
        init:VerifyCodeControllerImp() ,
        builder:(controller){
          return HandlingDataView(statusrequest: controller.statusrequest, widget:  Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: ListView(
                children: [

                  CustomTextTitleAuth(text: "32".tr),
                  CustomTextBodyAuth(
                      text:
                      "34".tr),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                    borderRadius:BorderRadius.circular(10),
                    keyboardType:TextInputType.phone ,
                    numberOfFields: 5,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    fieldWidth: 45,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode)async{
                    await  controller.goToResetPassword(verificationCode);
                    }, // end onSubmit
                  ),
                  // CustomTextFormFaild(
                  //   titletext: "15".tr,
                  //   hinttext: "16".tr,
                  //   suffixicon: Icon(Icons.email_outlined),
                  //   textEditingController: controller.email,
                  // ),
                  SizedBox(
                    height: 40,
                  ),


                ],
              ),
            ),
          ),);
        } ,)
    );
  }
}
