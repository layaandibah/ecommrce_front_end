import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomItemPicture extends StatelessWidget {
  String imageUrl;
  int discount;
  CustomItemPicture({required this.imageUrl,required this.discount,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          FadeInImage.assetNetwork(
            placeholder: ImageAsset.loadingPicture,
            placeholderFit: BoxFit.fill,
            image: imageUrl,
            height: 430,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: IconButton(onPressed:()=>Get.back(), icon:const Icon(Icons.clear,size:35,)),
          ),
          discount>0?Positioned(
            top: 15,
            left:15,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColor.promotioncolor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                    "Promotion",
                    style: TextStyle(
                        fontSize: 15, color: AppColor.white, height: 0),
                    textAlign: TextAlign.center,
                  )),
            ),
          ):const SizedBox(height: 0,width: 0,),
        ],
      ),
    );
  }
}
