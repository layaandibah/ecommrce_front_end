import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/itemdesc/customaddtobag.dart';
import 'package:ecommerce/view/widget/itemdesc/customitembutton.dart';
import 'package:ecommerce/view/widget/itemdesc/customitempicture.dart';
import 'package:ecommerce/view/widget/itemdesc/customnamedescriptionprice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/imageasset.dart';

class ItemDescription extends StatelessWidget {
  String imageUrl;
  int itemCount;
  int discount;
  void Function()? increaseFun;
  void Function()? decreaseFun;
  String name;
  String description;
  double price;
  double newPrice;
  double totalPrice;
  void Function()? onTap;

   ItemDescription(
      {required this.imageUrl,
      required this.itemCount,
        required this.discount,
      required this.increaseFun,
      required this.decreaseFun,
      required this.name,
      required this.description,
      required this.price,
        required this.newPrice,
      required this.totalPrice,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomItemPicture(imageUrl: imageUrl,discount:discount),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomItemButton(
                itemCount: itemCount,
                increaseFun: increaseFun,
                decreaseFun: decreaseFun),
            CustomNameDescriptionPrice(
                name: name, description: description,discount: discount ,price: price,newPrice:newPrice ,),
           discount>0? const SizedBox(
              height: 40,
            ):const SizedBox(
             height: 50,
           ),
            CustomAddToBag(
                title: "ADD TO BAG", totalPrice: totalPrice, onTap: onTap),
          ],
        ),
      ),
    );
  }
}
