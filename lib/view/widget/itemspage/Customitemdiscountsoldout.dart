import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../applinks.dart';

class CustomItemDisCountSoldOut extends StatelessWidget {
  final double? price;
  final ItemsModel itemsModel;
final dynamic updatePrice;

  const CustomItemDisCountSoldOut(
      {
        required this.price,
        Key? key,
         required this.itemsModel,required this.updatePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(

        child: Stack(
          children:[ Card(
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
                ],
              ),
            ),
          ),
            Positioned(
              top: 100,
              left: 30,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Sold out",
                  style: TextStyle(height: 0.0, color: AppColor.black),
                  textAlign: TextAlign.center,
                ),
                height: 25,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0.5,
                        color: Colors.black26,
                      )
                    ]),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(color: Colors.white38))
          ]
        ),
      ),
    );
  }
}
