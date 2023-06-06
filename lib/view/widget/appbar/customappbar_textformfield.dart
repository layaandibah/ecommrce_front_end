import 'package:flutter/material.dart';

class CustomTextFormFaildAppBar extends StatelessWidget {


  final String? Function(String?)? validator;
  final void Function()? onPressedIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
 final TextEditingController? controller;

  CustomTextFormFaildAppBar(
      {Key? key,

        required this.validator,required this.keyboardType, this.onPressedIcon,required this.hintText,required this.onChanged,required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin:const EdgeInsets.symmetric(vertical:3,horizontal: 7),
      child: TextFormField(
        controller: controller,
        onChanged:onChanged ,
        cursorColor:Colors.white ,
        keyboardType:keyboardType ,
        validator:validator ,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            suffixIcon: IconButton(icon:Icon(Icons.search),onPressed:onPressedIcon ),
            hintText: hintText,
            border: OutlineInputBorder(borderSide:BorderSide.none),
            hintStyle: TextStyle(fontSize: 17,color: Colors.white54),
            suffixIconColor: Colors.white54,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

        )
      ),
    );
  }
}
