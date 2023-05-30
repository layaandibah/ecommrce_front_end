import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomNameDescriptionPrice extends StatelessWidget {
  String name;
  String description;
  double price;
  CustomNameDescriptionPrice({required this.name,required this.description,required this.price,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(
        name,
        style:const TextStyle(
            color: AppColor.primarycolor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            description,
            style:const TextStyle(
                height: 1.3,
                color: AppColor.primarycolor,
                fontSize: 26,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        Text(
          "$price USD",
          style:const TextStyle(
              color: Colors.black, height: 3, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),],
    );
  }
}
