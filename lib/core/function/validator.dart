import 'package:get/get.dart';

valid(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "47".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "42".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "43".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "44".tr;
    }
  }

  if (val.length < min) {
    return "${"45".tr}$min";
  }
  if (val.length > max) {
    return "${"46".tr}$max";
  }

}
