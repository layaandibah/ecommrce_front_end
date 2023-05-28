import 'package:flutter/material.dart';

class CustomTextFormFaildAppBar extends StatelessWidget {


  final String? Function(String?)? validator;

  final TextInputType? keyboardType;
  CustomTextFormFaildAppBar(
      {Key? key,

        required this.validator,required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin:const EdgeInsets.symmetric(vertical:3,horizontal: 7),
      child: TextFormField(
        cursorColor:Colors.white ,
        keyboardType:keyboardType ,
        validator:validator ,
        decoration:const InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            suffixIcon: Icon(Icons.search),
            hintText: "search items",
            border: OutlineInputBorder(borderSide:BorderSide.none),
            hintStyle: TextStyle(fontSize: 17,color: Colors.white54),
            suffixIconColor: Colors.white54,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

        )
      ),
    );
  }
}
