import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomTextAuth extends StatelessWidget {
  final String questiontext;
  final String auth;
  final void Function()? onPressed;
  CustomBottomTextAuth({Key? key, required this.questiontext, required this.auth, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questiontext,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.end,
        ),
        TextButton(onPressed:onPressed,
          child: Text( auth,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: AppColor.primarycolor),
            textAlign: TextAlign.end,),
        ),
      ],
    );
  }
}
