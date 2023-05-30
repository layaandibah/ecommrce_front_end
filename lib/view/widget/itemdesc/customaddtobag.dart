import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAddToBag extends StatelessWidget {
  void Function()? onTap;
  String title;
  double totalPrice;
  CustomAddToBag({required this.title,required this.totalPrice,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: AppColor.primarycolor,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children:[ Center(
                child: Text(
                  title,
                  style:const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),Padding(
                padding:const EdgeInsets.symmetric(horizontal: 15),
                child: Text("$totalPrice USD",style:const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),),
              )],
            ),
          ),
        ));
  }
}
