import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:either_dart/either.dart';
//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class VerifyCodeData{

  Crud crud;

  VerifyCodeData(this.crud);

  postData(String? email,String? verifycde)async{
    var res=await crud.postData(AppLinks.verifycode,{
      "email":email ,
      "verifycode":verifycde
    });
    return  res.fold((left) =>left ,(right) =>right );
  }

}