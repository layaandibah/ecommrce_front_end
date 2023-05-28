import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();

  goToSignUp();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices=Get.find();
 GlobalKey<FormState> formState=GlobalKey<FormState>();
  StatusRequest? statusrequest;
  LogInData logInData=LogInData(Get.find());
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }

  @override
  login()async {
    if(formState.currentState!.validate()){
      statusrequest=StatusRequest.loading;
      update();
      var res= await logInData.postData(email.text,password.text);
      statusrequest=handlingData(res);
      print("=======Data========");
      //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
      if(StatusRequest.success==statusrequest){
        print("=======statusrequest========");

        //فحص الفشل بالباك اند
        if(res["status"]=="success"){

          //data.addAll(res["data"]);
          myServices.sharedPreferences.setString("id", res["data"]["users_id"]);
          myServices.sharedPreferences.setString("username", res["data"]["users_name"]);
          myServices.sharedPreferences.setString("email", res["data"]["users_email"]);
          myServices.sharedPreferences.setString("phone", res["data"]["users_phone"]);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.homepage);
        }else{
          //يوجد مشكلة في الباك اند
          Get.defaultDialog(title: "51".tr,middleText: "54".tr);
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      String? token=value;
    }
    );
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
