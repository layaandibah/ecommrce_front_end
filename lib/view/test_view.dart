import 'package:ecommerce/controller/testcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testview extends StatelessWidget {
  const Testview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
        appBar: AppBar(backgroundColor: AppColor.primarycolor,),
        body: GetBuilder<TestController>(builder: (controller)
    {
  return HandlingDataView(
    statusrequest: controller.statusrequest, widget: ListView.builder(
    itemCount: controller.data.length,
    itemBuilder: (context, i) {
    return Text("${controller.data[i]}");
    }),);
    }),
    );
    }
  }