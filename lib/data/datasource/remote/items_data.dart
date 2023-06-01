import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';


class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData()async{
    var res=await crud.postData(AppLinks.items,{});
    return  res.fold((left) =>left ,(right) =>right );
  }



}