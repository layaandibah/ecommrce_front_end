import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController{
  getAllItems(String catId,String itemsType,String userId);
  getSpecificItems(String catId,String itemsType,String userId);
  initData();
  changCat(val);
  updateprice(int discount,double price);
}
class ItemsControllerImp extends ItemsController{
  StatusRequest? statusrequest;
  late int selectedCat;
  late int tabIndex;
  late String catId;
  late String itemsType;
  late String userId;
  RxDouble? newprice;
  RxList items=[].obs;
  RxList specificItems=[].obs;
  // List itemsdiscount=[];
  // List itemsSoldOut=[];
  // List itemsdiscountsoldout=[];

  ItemsData itemsData=ItemsData(Get.find());

  @override
  getAllItems(String catId,String itemsType,String userId)async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData(catId,itemsType,userId);
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        items.clear();
        items.addAll(res["types"]);
      }else{
        //يوجد مشكلة في الباك اند
        // statusrequest=StatusRequest.nodata;
      }
    }
    update();
  }
  getSpecificItems(String catId,String itemsType,String userId)async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData(catId,itemsType,userId);
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        specificItems.clear();
        specificItems.addAll(res["data"]);
      }else{
        //يوجد مشكلة في الباك اند
        // statusrequest=StatusRequest.nodata;
      }
    }
    update();
  }
  changCat(val){
    selectedCat=val;
    update();
  }
  @override
  updateprice(discount, price)
  {
    newprice= double.parse((price-(price*discount/100)).toStringAsFixed(2)).obs;
  }
  initData(){
    selectedCat=Get.arguments["selectedCat"];
    catId=Get.arguments["catId"];
    tabIndex=-1;
    itemsType="-1";
    userId="1";
    getAllItems(catId,"-1",userId);
    getSpecificItems(catId, itemsType,userId);
  }
  @override
  void onInit() {

    initData();
    super.onInit();
  }
}