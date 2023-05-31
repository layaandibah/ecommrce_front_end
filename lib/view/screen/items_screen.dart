import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/item_description.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
import 'package:ecommerce/view/widget/itemspage/customitemform.dart';
import 'package:ecommerce/view/widget/itemspage/customlisttypes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/appbar/customappbar_cart.dart';
import '../widget/floatingactionbutton/customfloatingactionbuttoncoin.dart';
import '../widget/itemspage/customDialog.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? lbp = 1;
    int? usd = 42567;

    return SafeArea(
      child: GetBuilder<HomePageControllerImp>(
        init: HomePageControllerImp(),
        builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
              floatingActionButton: CustomFloatingActionButtonCoin(),
              appBar: AppBar(
                primary: true,
                leading: Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  );
                }),
                backgroundColor: AppColor.primarycolor,
                actions: [
                  InkWell(
                      onTap: () {
                        Get.offNamed(AppRoutes.successsignup);
                      },
                      child: CustomAppBarCartBox(count: 10))
                ],
                title: const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text("ecommerce"),
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  child: CustomTextFormFaildAppBar(
                      validator: (val) {}, keyboardType: TextInputType.text),
                  preferredSize: Size.fromHeight(82),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //List of Types
                  CustomListTypes(),
                  //Default sorting
                  CustomDialog(),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.items.length,
                      itemBuilder: (context, i) {
                        return CustomItemForm(
                          itemCount: controller.items.length,
                          imageUrl:
                              "${AppLinks.items}/${controller.items[i]['items_image']}",
                          itemName: "${controller.items[i]["items_name"]}",
                          description: '${controller.items[i]["items_desc"]}',
                          price: controller.items[i]["items_price"],
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => ItemDescription(
                                    imageUrl:
                                        "${AppLinks.items}/${controller.items[i]['items_image']}",
                                    itemCount: 5,
                                    discount: controller.items[i]["items_discount"],
                                    increaseFun:(){},
                                    decreaseFun: (){},
                                    name: "${controller.items[i]["items_name"]}",
                                    description:"${controller.items[i]["items_desc"]}",
                                    price: controller.items[i]["items_price"],
                                    newPrice: controller.newprice!,
                                    totalPrice: 5.36,
                                    onTap:(){}));
                          },
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.59),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
