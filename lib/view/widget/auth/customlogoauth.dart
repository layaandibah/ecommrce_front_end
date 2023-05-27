import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAsset.logo,height: 125,);
  }
}
