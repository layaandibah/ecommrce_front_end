import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';

abstract class HomePageController extends GetxController{
  initialData();
  getData();
}
class HomePageControllerImp extends HomePageController{
  MyServices myServices=Get.find();
  String? username;
  int? id;

  StatusRequest? statusrequest;
  HomeData homeData=HomeData(Get.find());
  List categories=[];

  @override
  initialData(){
    username=myServices.sharedPreferences.getString("username");
    id=myServices.sharedPreferences.getInt("id");
  }


  @override
  getData()async {
    statusrequest=StatusRequest.loading;
    var res=await homeData.getData();
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        categories.addAll(res["categories"]);
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
    initialData();
    super.onInit();
  }

}
