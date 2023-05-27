import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController
{
  TestData testData=TestData(Get.find());
    List data=[];
   late StatusRequest statusrequest;

   getData()async{
     statusrequest=StatusRequest.loading;
     var res=await testData.getData();
     statusrequest=handlingData(res);
     //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
     if(StatusRequest.success==statusrequest){
       //فحص الفشل بالباك اند
       if(res["status"]=="success"){
         print("====================");
         data.addAll(res["data"]);
       }else{
         //يوجد مشكلة في الباك اند
         statusrequest=StatusRequest.nodata;
       }
     }
    update();
   }

@override
  void onInit() {
    getData();
    super.onInit();
  }
}