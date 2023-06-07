import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';


class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData(String id,String itemsType,String userId)async{
    var res=await crud.postData(AppLinks.itemspage,{"category_id":id,"items_type":itemsType,"user_id":userId});
    return  res.fold((left) =>left ,(right) =>right );
  }


}