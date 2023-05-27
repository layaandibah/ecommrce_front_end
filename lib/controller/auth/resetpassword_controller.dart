import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/resetpassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  StatusRequest? statusrequest;
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  String? email;
  @override
  resetPassword() {

  }

  @override
  goToSuccessResetPassword()async {
    if(password.text!=repassword.text){
     var res= Get.defaultDialog(title: "51".tr,middleText: "56".tr);
       update();
       return res;
    }
    if(formstate.currentState!.validate()){
      statusrequest=StatusRequest.loading;
      update();
      var res= await resetPasswordData.postData(email!,password.text);
      statusrequest=handlingData(res);
      print("=======Data========");
      //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
      if(StatusRequest.success==statusrequest){
        print("=======statusrequest========");

        //فحص الفشل بالباك اند
        if(res["status"]=="success"){

          //data.addAll(res["data"]);
          Get.offNamed(AppRoutes.successresetpassword);
        }else{
          //يوجد مشكلة في الباك اند
          Get.defaultDialog(title: "51".tr,middleText: "57".tr);
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
   email=Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
