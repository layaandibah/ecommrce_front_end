import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  String text;
  CustomTextBodyAuth({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal:3),
        child: Text(
         text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium

        ));
  }
}
