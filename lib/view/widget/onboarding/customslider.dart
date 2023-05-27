import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.changedPage(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            //

            Image.asset(onBoardingList[i].image!,
                width: 270, height: 300, fit: BoxFit.fill),
             SizedBox(height: 20,),
            Text(
              onBoardingList[i].title!,
              style:Theme.of(context).textTheme.displayLarge ,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge
              ),
            )
          ],
        );
      },
    );
  }
}
