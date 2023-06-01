import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonCart({Key? key,required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
      child:MaterialButton(
        onPressed: onPressed,
        color: AppColor.primarycolor,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.1)),
        height: 55,
        minWidth: double.infinity,
        child: Text(title,style:const TextStyle(color: Colors.white),),
      ),
    );
  }
}
