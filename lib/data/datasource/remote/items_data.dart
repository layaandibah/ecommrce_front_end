import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';


class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData(String id)async{
    var res=await crud.postData(AppLinks.itemspage,{"category_id":id});
    return  res.fold((left) =>left ,(right) =>right );
  }



}