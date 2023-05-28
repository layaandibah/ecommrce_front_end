import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButtonCoin extends StatelessWidget {

 int? usd=10;
 int? lbp=345;
  CustomFloatingActionButtonCoin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,right: 7),
      child: SizedBox(
        height: 25,
        child: FloatingActionButton.extended(

          extendedPadding:const EdgeInsets.symmetric(horizontal:5,vertical:double.minPositive),
          onPressed: null,
          backgroundColor: AppColor.primarycolor,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          label:  Text("$usd USD=$lbp LBP",style:const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
