import 'dart:io';

import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 Future<bool> exitDialog()
{

  Get.defaultDialog(
    title: "51".tr,
    middleText: "48".tr,
    actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("49".tr,style:TextStyle(fontWeight: FontWeight.bold) ,),style:ButtonStyle(backgroundColor:MaterialStatePropertyAll(AppColor.primarycolor) ) ),
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("50".tr),style:ButtonStyle(backgroundColor:MaterialStatePropertyAll(AppColor.primarycolor) )),
    ]

  );
return Future.value(true);
}