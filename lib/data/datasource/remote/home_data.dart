import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:either_dart/either.dart';

class HomeData{

  Crud crud;

  HomeData(this.crud);

  getData()async{
    var res=await crud.postData(AppLinks.homepage,{});
    return  res.fold((left) =>left ,(right) =>right );
  }



}