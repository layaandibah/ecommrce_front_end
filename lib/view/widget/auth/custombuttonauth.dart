import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtonAuth({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height:40,
      child: MaterialButton(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
         color: AppColor.primarycolor,
        onPressed: onPressed,child: Text(text,style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
