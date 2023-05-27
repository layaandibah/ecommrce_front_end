import 'package:ecommerce/controller/password_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validator.dart';

import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/custompassword.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetpassword_controller.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
        ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.wightpurble,
        elevation: 0.0,
        title: Text(
          "30".tr,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .copyWith(
            fontSize: 18,
            color: AppColor.gray,
          ),
        ),
      ),
      body:GetBuilder<ResetPasswordControllerImp>(
        init: ResetPasswordControllerImp(),
        builder: (controller){
        return HandlingDataView(statusrequest: controller.statusrequest, widget:  Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "35".tr),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder(
                      init: PasswordControllerImp(), builder: (control) {
                    return CustomPassword(
                      validator: (val){
                        return valid(val!,5,30,"password");
                      },
                      passwordanable: control.password1,
                      titletext: "17".tr,
                      hinttext: "18".tr,
                      textEditingController: controller.password,
                      onPressed: () {
                        control.changePass1Enable();
                        print(control.password1);

                      },);

                  }),
                  GetBuilder(
                      init: PasswordControllerImp(), builder: (control) {
                    return CustomPassword(
                      validator: (val){
                        return valid(val!,5,30,"password");
                      },
                      passwordanable: control.password2,
                      titletext: "17".tr,
                      hinttext: "37".tr,
                      textEditingController: controller.repassword,
                      onPressed: () {
                        control.changePass2Enable();
                        print(control.password2);
                      },);

                  })

                  ,SizedBox(
                    height: 40,
                  ),
                  CustomButtonAuth(onPressed: () {
                    controller.goToSuccessResetPassword();
                  }, text: "36".tr),

                ],
              ),
            ),
          ),
        ),);
      },)
    );
  }
}
