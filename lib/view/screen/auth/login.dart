import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/controller/password_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/exitapp.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/view/widget/auth/custombuttomntextauth.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customlogoauth.dart';
import 'package:ecommerce/view/widget/auth/custompassword.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformfaild.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.wightpurble,
          elevation: 0.0,
          title: Text(
            "12".tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: AppColor.gray,
                ),
          ),
        ),
        body: WillPopScope(
          onWillPop: exitDialog,
          child: GetBuilder<LogInControllerImp>(
            init:LogInControllerImp() ,
            builder: (controller){
            return HandlingDataView(statusrequest: controller.statusrequest,widget:Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      CustomLogoAuth(),
                      CustomTextTitleAuth(text: "13".tr),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextBodyAuth(text: "14".tr),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormFaild(
                        validator: (val) {
                          return valid(val!, 5, 100, "email");
                        },
                        keyboardType: TextInputType.emailAddress,
                        titletext: "15".tr,
                        hinttext: "16".tr,
                        suffixicon: Icon(Icons.email_outlined),
                        textEditingController: controller.email,
                      ),
                      GetBuilder(
                          init: PasswordControllerImp(),
                          builder: (control) {
                            return CustomPassword(
                              validator: (val) {
                                return valid(val!, 5, 50, "password");
                              },
                              passwordanable: control.password3,
                              titletext: "17".tr,
                              hinttext: "18".tr,
                              textEditingController: controller.password,
                              onPressed: () {
                                control.changePass3Enable();
                                print(control.password3);
                              },
                            );
                          }),
                      InkWell(
                        onTap: () {
                          Get.toNamed(controller.goToForgetPassword());
                        },
                        child: Text(
                          "19".tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomButtonAuth(
                          onPressed: () {
                           controller.login();
                          },
                          text: "12".tr),
                      SizedBox(
                        height: 15,
                      ),
                      CustomBottomTextAuth(
                        questiontext: "20".tr,
                        auth: "21".tr,
                        onPressed: () {
                          controller.goToSignUp();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ) ,);
          },)));
}}
