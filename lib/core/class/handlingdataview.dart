import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusrequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusrequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusrequest == StatusRequest.loading ?
      Center(child: Lottie.asset(ImageAsset.loading,width: 100,height: 100)):
      statusrequest == StatusRequest.serverfailure?
      Center(child: Lottie.asset(ImageAsset.server,width: 100,height: 100)):
      statusrequest == StatusRequest.offlinefailure?
      Center(child: Lottie.asset(ImageAsset.offline,width: 100,height: 100)):
      statusrequest == StatusRequest.nodata?
      Center(child: Lottie.asset(ImageAsset.nodata,width: 100,height: 100,repeat: true,)):
      widget;

  }
}
