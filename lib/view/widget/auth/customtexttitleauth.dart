import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  String text;
  CustomTextTitleAuth({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 27, color: AppColor.black),
    );
  }
}
