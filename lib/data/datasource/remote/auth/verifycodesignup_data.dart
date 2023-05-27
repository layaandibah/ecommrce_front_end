import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/core/class/crud.dart';

class VerifyCodeSignUpData {

  Crud crud;
  VerifyCodeSignUpData(this.crud);

  checkcode(String? email,String? verifycode)async{
   var res= await crud.postData(AppLinks.verifycodeSignUp,{
     "email":email,
     "verifycode":verifycode
   });
   return res.fold((left) => left, (right) => right);
  }

}