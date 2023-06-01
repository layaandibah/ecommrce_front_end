import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController{
  getAllItems();

}
class ItemsControllerImp extends ItemsController{
  StatusRequest? statusrequest;

  ItemsData itemsData=ItemsData(Get.find());
 List items=[];
  @override
  getAllItems()async {
    statusrequest=StatusRequest.loading;
    var res=await itemsData.getData();
    statusrequest=handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if(StatusRequest.success==statusrequest){
      //فحص الفشل بالباك اند
      if(res["status"]=="success"){
        print("====================");
        items.addAll(res["data"]);

      }else{
        //يوجد مشكلة في الباك اند
        statusrequest=StatusRequest.nodata;
      }
    }
    update();
  }


}