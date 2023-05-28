import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAppBarCartBox extends StatelessWidget {
  final int count;
  const CustomAppBarCartBox({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 6, top: 20, bottom:3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.wightpurble,
      ),
      height: 40,
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.shopping_basket_sharp,
            color: AppColor.primarycolor,
            size: 30,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: AppColor.primarycolor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("$count",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
