import 'package:ecommerce/view/widget/appbar/customappbar_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import 'customappbar_textformfield.dart';

class CustomAppBar extends StatelessWidget {
 final void Function()? onpressedCart;
 final void Function()? onPressedIcon;
 final String? formFaildText;
  CustomAppBar({Key? key,required this.onpressedCart,required this.onPressedIcon,required this.formFaildText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:135
      ,
      width: double.infinity,
      child: AppBar(
        primary: true,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(
                Icons.notes,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        }),
        backgroundColor: AppColor.primarycolor,
        actions: [
          InkWell(
              onTap:
                onPressedIcon
              ,
              child: CustomAppBarCartBox(count: 10))
        ],
        title: const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text("ecommerce"),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: CustomTextFormFaildAppBar(
            onPressedIcon:onPressedIcon ,
              validator: (val) {}, keyboardType: TextInputType.text, hintText: formFaildText,),
          preferredSize: Size.fromHeight(82),
        ),
      ),
    );
  }
}
