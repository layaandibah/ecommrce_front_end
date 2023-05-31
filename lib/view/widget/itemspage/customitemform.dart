import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../applinks.dart';

class CustomItemForm extends StatelessWidget {
  final int itemCount;
  final String imageUrl;
  final String itemName;
  final String description;
  final double price;
  void Function()? onTap;

  CustomItemForm(
      {required this.itemCount,
      required this.imageUrl,
      required this.itemName,
      required this.description,
      required this.price,
        required this.onTap,
      Key? key})
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
                        imageUrl,
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
                Text(itemName),
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5),
                ),
                Text(
                  "$price",
                  style: TextStyle(
                      color: AppColor.primarycolor, fontSize: 13, height: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
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
