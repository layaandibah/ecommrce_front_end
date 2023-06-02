import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applinks.dart';
import '../../../data/model/itemsmodel.dart';



class CustomItemForm extends GetView<HomePageControllerImp> {
  void Function()? onTap;
  final ItemsModel itemsModel;

  CustomItemForm(
      {
      required this.onTap,
      Key? key,
      required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: Image.network(
                        "${AppLinks.items}/${itemsModel.itemsImage}",
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border,
                          size: 40,
                          color: Colors.grey,
                        ))
                  ],
                ),
                Text("${itemsModel.itemsName}"),
                Text(
                  "${itemsModel.itemsDesc}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5),
                ),
                Text(
                  "${itemsModel.itemsPrice}",
                  style: TextStyle(
                      color: AppColor.primarycolor, fontSize: 13, height: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: (){
                          controller.addToCart();
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 35,
                          color: AppColor.primarycolor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
