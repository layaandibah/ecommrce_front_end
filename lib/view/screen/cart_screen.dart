import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:ecommerce/view/widget/cart/customcart.dart';
import 'package:ecommerce/view/widget/cart/customdeliverytime.dart';
import 'package:ecommerce/view/widget/cart/customlocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../applinks.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widget/cart/customtotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int groupVal=1;
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return SafeArea(
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              primary: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () => Get.back(),
              ),
              backgroundColor: AppColor.primarycolor,
              title: const Text("ecommerce"),
              elevation: 0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  CustomLocation(
                      addressNickname: "addressNickname", city: "city", streetAndAddressDetails: "streetAndAddressDetails"),
                  MaterialButton(
                    onPressed: () {},
                    height: 40,
                    minWidth: double.infinity,
                    color: Colors.white70,
                    child: const Text(
                      "Clear Order",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, i) {
                      return CustomCart(
                        itemCount: 7,
                        name: "${controller.categories[i]["categories_name"]}",
                        description: "mix of some fruits",
                        price: 1.54,
                        imageUrl:
                            "${AppLinks.categories}/${controller.categories[i]['categories_image']}",
                        totalPrice: 24.5,
                        decreaseFun: () {},
                        increaseFun: () {},
                        deleteFun: () {},
                        editFun: () {},
                      );
                    },
                  ),
                  CustomDeliveryTime(
                    groupVal: groupVal,
                      titleDay: "Today",
                      titleTime: "12:30pm",
                      choseDayFun: () {},
                      choseTimeFun: () {},
                      textFormFieldController: TextEditingController()),
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                    ),
                    child: Text("87.95 USD + 0.00 USD [ Delivery Fee ]"),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  CustomTotal(
                    totalUSD: 12.45,
                    totalLBP: 4435464684,
                  ),
                  CustomButtonCart(
                    title: "SIGN IN TO CHECKOUT",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
