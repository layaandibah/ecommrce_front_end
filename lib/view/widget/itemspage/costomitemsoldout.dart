import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../applinks.dart';
import '../../../data/model/itemsmodel.dart';

class CustomItemSoldOut extends StatelessWidget {
  // final int itemCount;
  // final String imageUrl;
  // final String itemName;
  // final String description;
  // final double price;

  final ItemsModel itemsModel;

  CustomItemSoldOut(
      {
      // required this.itemCount,
      // required this.imageUrl,
      // required this.itemName,
      // required this.description,
      // required this.price,

      Key? key,
      required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        child: Stack(
            children: [
          Card(
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
        ]),
      ),
    );
  }
}
