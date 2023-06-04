import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController{
  getAllItems(String catId,String itemsType);
  getSpecificItems(String catId,String itemsType);
  initData();
  changCat(val);
  updateprice(int discount,double price);
}
class ItemsControllerImp extends ItemsController{
  StatusRequest? statusrequest;
  late int selectedCat;
  late String catId;
  late String itemsType;
  RxDouble? newprice;
  RxList items=[].obs;
  RxList specificItems=[].obs;
  // List itemsdiscount=[];
  // List itemsSoldOut=[];
  // List itemsdiscountsoldout=[];

  ItemsData itemsData=ItemsData(Get.find());

  @override
  getAllItems(catId,itemsType)async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData(catId,itemsType);
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        // items.addAll(res["items"]);
        // itemsdiscount.addAll(res["itemsdiscount"]);
        // itemsdiscountsoldout.addAll(res["itemsdiscountsoldout"]);
        // itemsSoldOut.addAll(res["itemssoldout"]);
        items.addAll(res["data"]);
      }else{
        //يوجد مشكلة في الباك اند
        // statusrequest=StatusRequest.nodata;
      }
    }
    update();
  }
  getSpecificItems(catId,itemsType)async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData(catId,itemsType);
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        // items.addAll(res["items"]);
        // itemsdiscount.addAll(res["itemsdiscount"]);
        // itemsdiscountsoldout.addAll(res["itemsdiscountsoldout"]);
        // itemsSoldOut.addAll(res["itemssoldout"]);
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
    itemsType="-1";
    getAllItems(catId,"-1");
    getSpecificItems(catId, itemsType);
  }
  @override
  void onInit() {

    initData();
    super.onInit();
  }
}