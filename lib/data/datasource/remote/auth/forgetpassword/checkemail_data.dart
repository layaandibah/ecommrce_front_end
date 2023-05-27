import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:either_dart/either.dart';
//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class CheckEmailData{

  Crud crud;

  CheckEmailData(this.crud);

  postData(String email)async{
    var res=await crud.postData(AppLinks.checkemail,{
      "email":email ,
    });
    return  res.fold((left) =>left ,(right) =>right );
  }

}