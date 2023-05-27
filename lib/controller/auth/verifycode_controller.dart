import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/verifycode_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verify);

  checkCode();
}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;
  VerifyCodeData verifyCode=VerifyCodeData(Get.find());
  StatusRequest? statusrequest;
  @override
  checkCode() {

  }


  goToResetPassword (String verify) async {
    var res= await verifyCode.postData(email,verify);
    statusrequest=StatusRequest.loading;
    update();
    statusrequest=handlingData(res);
    print("=======Data========");
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      print("=======statusrequest========");

      //فحص الفشل بالباك اند
      if(res["status"]=="success"){

        //data.addAll(res["data"]);
        Get.offNamed(AppRoutes.resetpassword,arguments:{
          "email":email
        });
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
