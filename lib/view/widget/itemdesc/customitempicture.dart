import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemPicture extends StatelessWidget {
  String imageUrl;
  CustomItemPicture({required this.imageUrl,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        FadeInImage.assetNetwork(
          placeholder: ImageAsset.loadingPicture,
          placeholderFit: BoxFit.fill,
          image: imageUrl,
          height: 400,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: IconButton(onPressed:()=>Get.back(), icon:const Icon(Icons.clear,size:35,)),
        )
      ],
    );
  }
}
