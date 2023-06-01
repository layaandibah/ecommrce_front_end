import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomNameDescriptionPrice extends StatelessWidget {
  String name;
  String description;
 final int discount;
 final double newPrice;
  double price;
  CustomNameDescriptionPrice({required this.name,required this.description,required this.discount,required this.newPrice,required this.price,Key? key}) : super(key: key);

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
       discount>0? Container(
         width: 60,
         height: 30,
         decoration: BoxDecoration(
             color: AppColor.pink,
             borderRadius: BorderRadius.circular(10)),
         child: Center(
             child: Text(
               "$discount%",
               style: TextStyle(
                   fontSize: 15, color: AppColor.white, height: 0),
               textAlign: TextAlign.center,
             )),
       ):const SizedBox(height: 30,),
        discount>0?RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "$price",
                style:const TextStyle(
                  color: AppColor.gray,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColor.gray,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
    TextSpan(
    text: "$newPrice USD",
    style:const TextStyle(
    color: AppColor.primarycolor,
    fontWeight:
    FontWeight.bold,
    ),

    ),
            ],
          ),
        ):const SizedBox(height:0,),
        Text(
          "$price USD",
          style:const TextStyle(
              color: Colors.black, height: 0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
