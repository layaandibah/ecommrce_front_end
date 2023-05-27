import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  StatusRequest? statusrequest;
   List data=[];
   SignUpData signUpData=SignUpData(Get.find());
  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signup() async {
    if(formstate.currentState!.validate()){
      statusrequest=StatusRequest.loading;
      update();
      var res= await signUpData.postData(username.text,email.text,password.text,phone.text);
      statusrequest=handlingData(res);
      print("=======Data========");
      //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
      if(StatusRequest.success==statusrequest){
        print("=======statusrequest========");

        //فحص الفشل بالباك اند
        if(res["status"]=="success"){

          //data.addAll(res["data"]);
          Get.toNamed(AppRoutes.verifycodesignup,arguments: {
            "email":email.text
          });
        }else{
          //يوجد مشكلة في الباك اند
          Get.defaultDialog(title: "51".tr,middleText: "53".tr);
          statusrequest=StatusRequest.nodata;
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
   // statusrequest=StatusRequest.loading;
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }
}
