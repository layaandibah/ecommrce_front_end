import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:either_dart/either.dart';
//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class ResetPasswordData{

  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email,String password)async{
    var res=await crud.postData(AppLinks.resetpassword,{
      "email":email ,
      "password":password ,

    });
    return  res.fold((left) =>left ,(right) =>right );
  }



}