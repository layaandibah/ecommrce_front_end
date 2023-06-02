import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController{
  getAllItems(String catId);
  initData();
  changCat(val);
  updateprice(int discount,double price);
}
class ItemsControllerImp extends ItemsController{
  StatusRequest? statusrequest;
 late List<dynamic> categories;
 late int selectedCat;
 late String catId;
  double? newprice;
  List items=[];
  // List itemsdiscount=[];
  // List itemsSoldOut=[];
  // List itemsdiscountsoldout=[];

  ItemsData itemsData=ItemsData(Get.find());

  @override
  getAllItems(catId)async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData(catId);
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
changCat(val){
    selectedCat=val;
    update();
}
  @override
  updateprice(discount, price)
  {
    newprice= double.parse((price-(price*discount/100)).toStringAsFixed(2));
  }
initData(){
    categories=Get.arguments["categories"];
    selectedCat=Get.arguments["selectedCat"];
    catId=Get.arguments["catId"];
    getAllItems(catId);
}
@override
  void onInit() {

    initData();
    super.onInit();
  }
}