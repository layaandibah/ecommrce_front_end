import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomItemButton extends StatelessWidget {
  int itemCount;
  void Function()? increaseFun;
  void Function()? decreaseFun;
  CustomItemButton({required this.itemCount,required this.increaseFun,required this.decreaseFun,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primarycolor,width: 2),
          borderRadius: BorderRadius.circular(45)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed:decreaseFun, icon:const Icon(Icons.remove,color: AppColor.primarycolor)),
          Text("$itemCount",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,height: 0),),
          IconButton(onPressed:increaseFun, icon:const Icon(Icons.add,color: AppColor.primarycolor,)),],),
    );
  }
}
