import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:either_dart/either.dart';

class TestData{

  Crud crud;

  TestData(this.crud);
  
  getData()async{
    var res=await crud.postData(AppLinks.testlink,{});
  return  res.fold((left) =>left ,(right) =>right );
  }



}