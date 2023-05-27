import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController
{
  goToLogIn();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }

}