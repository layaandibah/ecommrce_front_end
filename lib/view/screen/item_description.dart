import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/itemdesc/customaddtobag.dart';
import 'package:ecommerce/view/widget/itemdesc/customitembutton.dart';
import 'package:ecommerce/view/widget/itemdesc/customitempicture.dart';
import 'package:ecommerce/view/widget/itemdesc/customnamedescriptionprice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/imageasset.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomItemPicture(imageUrl:""),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(height: 30,),
            CustomItemButton(itemCount:4, increaseFun:(){}, decreaseFun:(){}),
            CustomNameDescriptionPrice(name:"Tanmia.", description: "Mortadella Chicken Plain, 200g", price:1.47),
            const SizedBox(
              height: 30,
            ),
            CustomAddToBag(title:"ADD TO BAG", totalPrice: 12.56, onTap:(){}),
          ],
        ),
      ),
    );
  }
}
