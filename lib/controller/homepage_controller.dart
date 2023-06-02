import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';

abstract class HomePageController extends GetxController{
  initialData();
  getData();
  updateprice(int discount,double price);
  goToItims(List<dynamic> categories,int selectedCat,String categoriesId);
  addToCart();
}
class HomePageControllerImp extends HomePageController{
  MyServices myServices=Get.find();
  String? username;
  int? id;
  int? discount;
  double? price;
  StatusRequest? statusrequest;
  HomeData homeData=HomeData(Get.find());
  List categories=[];
  List itemsdiscount=[];
  List itemsSoldOut=[];
  List itemsdiscountsoldout=[];
  double? newprice;
  int addtocart=0;

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
        itemsdiscount.addAll(res["itemsdiscount"]);
        itemsSoldOut.addAll(res["itemssoldout"]);
        itemsdiscountsoldout.addAll(res["itemsdiscountsoldout"]);

      }else{
        //يوجد مشكلة في الباك اند
        statusrequest=StatusRequest.nodata;
      }
    }
    update();
  }
  updateprice(int discount,double price)
  {
    newprice= double.parse((price-(price*discount/100)).toStringAsFixed(2));
  }
  chooseitem(){

  }
  goToItims(categories,selectedCat,categoriesId){
    Get.toNamed(AppRoutes.itemsscreen,arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": categoriesId,
    } );

  }
  addToCart(){
    addtocart++;
    print(addtocart);
    update();
  }
  @override
  void onInit() {

    getData();
    initialData();
    super.onInit();
  }

}
