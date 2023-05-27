import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verify);

  checkCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  String? email;
  VerifyCodeSignUpData verifyCode=VerifyCodeSignUpData(Get.find());
  StatusRequest? statusrequest;
  @override
  checkCode() {

  }


  goToSuccessSignUp (String verify) async {
    statusrequest=StatusRequest.loading;
    update();
    var res= await verifyCode.checkcode(email!,verify);
    statusrequest=handlingData(res);
    print("=======Data========");
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      print("=======statusrequest========");

      //فحص الفشل بالباك اند
      if(res["status"]=="success"){

        //data.addAll(res["data"]);
        Get.offNamed(AppRoutes.successsignup);
      }else{
        //يوجد مشكلة في الباك اند
        Get.defaultDialog(title: "51".tr,middleText: "52".tr);

      }
    }
    update();

  }
    //


  @override
  void onInit() {
   email= Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
