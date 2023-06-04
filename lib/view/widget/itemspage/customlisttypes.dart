import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomListTypes extends StatelessWidget {
  final ItemsModel itemsModel;
  final int itemCount;
  const CustomListTypes({Key? key, required this.itemsModel, required this.itemCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: 50,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {},
            child: Text("${itemsModel.typeName}"),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
