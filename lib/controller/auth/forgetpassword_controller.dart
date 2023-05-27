import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/checkemail_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordcontroller extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordcontroller {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusrequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var res = await checkEmailData.postData(email.text);
      statusrequest = handlingData(res);
      print("=======Data========");
      //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
      if (StatusRequest.success == statusrequest) {
        print("=======statusrequest========");

        //فحص الفشل بالباك اند
        if (res["status"] == "success") {
          //data.addAll(res["data"]);
          Get.offNamed(AppRoutes.verifycode, arguments: {"email": email.text});
        } else {
          //يوجد مشكلة في الباك اند
          Get.defaultDialog(title: "51".tr, middleText: "55".tr);
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
   // email.dispose();
    super.dispose();
  }
}
