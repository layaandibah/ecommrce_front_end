import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../applinks.dart';

class CustomItemWithDisCount extends StatelessWidget {
  // final int itemCount;
  // final String imageUrl;
  // final String itemName;
  // final String description;
   final double? price;
  // final double newprice;
  // final int discount;
 final ItemsModel itemsModel;
  final void Function()? onTap;

  const CustomItemWithDisCount(
      {
      //   required this.itemCount,
      // required this.imageUrl,
      // required this.itemName,
      // required this.description,
       required this.price,
      Key? key,
      // required this.discount,
      // required this.newprice,
        required this.onTap, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap:onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: FadeInImage.assetNetwork(
                          placeholder: ImageAsset.loadingPicture,
                          placeholderFit: BoxFit.fill,
                          placeholderCacheHeight: 120,
                          image: "${AppLinks.items}/${itemsModel.itemsImage}",
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 115,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColor.pink,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              "${itemsModel.itemsDiscount}%",
                          style: TextStyle(
                              fontSize: 15, color: AppColor.white, height: 0),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_border,
                          size: 40,
                          color: Colors.grey,
                        )),
                    Positioned(
                      left: 3,
                      child: Container(
                        width: 120,
                        height: 30,
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
                    ),
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
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$price",
                  style: const TextStyle(
                      fontSize: 15, color: AppColor.primarycolor, height: 1.5),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "${itemsModel.itemsPrice}",
                        style: TextStyle(
                          color: AppColor.gray,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColor.gray,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
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
