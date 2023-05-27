import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomPassword extends StatelessWidget {
  String titletext;
  String hinttext;
final bool  passwordanable;
final String? Function(String?)? validator;
 final void Function()? onPressed;

  TextEditingController textEditingController;
  CustomPassword(
      {Key? key,
        required this.titletext,
        required this.hinttext,
        required this.textEditingController,
        required this.passwordanable,
        this.onPressed, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(margin: EdgeInsets.only(bottom: 15),
      child:  TextFormField(
        validator: validator,
          obscureText:passwordanable ,
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: IconButton(onPressed:onPressed, icon: Icon(passwordanable == true ?Ionicons.eye_off_outline:Ionicons.eye_outline)) ,
              hintText: hinttext,
              hintStyle: TextStyle(fontSize: 11),
              label:Container(margin: EdgeInsets.only(left: 12),child:Text(titletext,style: TextStyle(fontSize: 17),) ,),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 19),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        )

    );
  }
}
