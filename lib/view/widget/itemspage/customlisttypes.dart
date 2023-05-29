import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomListTypes extends StatelessWidget {
  CustomListTypes({Key? key}) : super(key: key);
  List myList = ["Kasswar", "Maya", "Yael","books","school", "Yael","books","school"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: 50,
      child: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {},
            child: Text("${myList[index]}"),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
