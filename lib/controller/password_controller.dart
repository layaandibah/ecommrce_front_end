import 'package:get/get.dart';

abstract class PasswordController extends GetxController{
  changePass1Enable();
  changePass2Enable();
  changePass3Enable();
  changePass4Enable();

}
class PasswordControllerImp extends PasswordController{
  bool password1=true;
  bool password2=true;
  bool password3=true;
  bool password4=true;


  @override
  changePass1Enable() {
    if(password1) {password1=false;}
    else          {password1=true; }
    update();
  }

  @override
  changePass2Enable() {
    if(password2) {password2=false;}
    else          {password2=true; }
    update();
  }
  @override
  changePass3Enable() {
    if(password3) {password3=false;}
    else          {password3=true; }
    update();
  }
  @override
  changePass4Enable() {
    if(password4) {password4=false;}
    else          {password4=true; }
    update();
  }




}