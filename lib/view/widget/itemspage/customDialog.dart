import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int groupVal=0;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [const SizedBox(height: 55,width:double.infinity,),
        Container(
          height: 30,
          width: 200,
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: AppColor.white,
          child: InkWell(
            onTap: (){
              showDialog(context: context, builder:(_){
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: 350,
                    width:225,
                    color: AppColor.dialogColor,
                    child: Column(
                      children: [
                        MyRadioListTile(value:1,groupVal: groupVal,title:"Default sorting",
                            onChanged:(value){
                          groupVal=value!;
                          Get.back();
                        }),
                        const Divider(color: AppColor.white,),
                        MyRadioListTile(value:2,groupVal: groupVal,title:"Lowest price",
                            onChanged:(value){
                          groupVal=value!;
                        Get.back();}),
                        const Divider(color: AppColor.white,),
                        MyRadioListTile(value:3,groupVal: groupVal,title:"Highest price",
                            onChanged:(value){
                          groupVal=value!;
                        Get.back();}),
                        const Divider(color: AppColor.white,),
                        MyRadioListTile(value:4,groupVal: groupVal,title:"By brand down",
                            onChanged:(value){
                          groupVal=value!;
                        Get.back();}),
                        const Divider(color: AppColor.white,),
                        MyRadioListTile(value:5,groupVal: groupVal,title:"By brand up",
                            onChanged:(value){
                          groupVal=value!;
                        Get.back();}),
                      ],
                    ),
                  ),
                );
              });
            },
            child: Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 5),
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Default sorting",style: TextStyle(height: 0),),
                  Icon(Icons.notes)
                ],),
            ),
          ),
        ),],
    );
  }
}

class MyRadioListTile extends StatelessWidget {
  int groupVal;
  int value;
  String title;
  void Function(int?)? onChanged;
  MyRadioListTile({required this.value,required this.groupVal,required this.title,required this.onChanged,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding:const EdgeInsets.symmetric(horizontal: 10),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.cyan,
      groupValue:groupVal,
      value: value,
      onChanged: onChanged,
      title:Text(
        title,
        style:const TextStyle(fontSize: 18,color: AppColor.white),),
    );
  }
}
