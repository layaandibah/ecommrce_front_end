import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/item_description.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
import 'package:ecommerce/view/widget/itemspage/Customitemdiscountsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/costomitemsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/customitemform.dart';
import 'package:ecommerce/view/widget/itemspage/customitemwithdiscount.dart';
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
      child: GetX<ItemsControllerImp>(
        init: ItemsControllerImp(),
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
                      child: CustomAppBarCartBox())
                ],
                title: const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text("ecommerce"),
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  child: CustomTextFormFaildAppBar(
                    validator: (val) {},
                    keyboardType: TextInputType.text,
                    hintText: 'search items',
                  ),
                  preferredSize: Size.fromHeight(82),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //List of Types
                    Container(
                      color: AppColor.white,
                      height: 50,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                controller.getSpecificItems(
                                    controller.catId,
                                    "-1");
                              },
                              child:const Text("All"),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics:const NeverScrollableScrollPhysics(),
                              itemCount: controller.items.value.length,
                              itemBuilder: (context, i) {
                                return MaterialButton(
                                  onPressed: () {
                                    controller.getSpecificItems(
                                        "${controller.items.value[i]["categories_id"]}",
                                        "${controller.items.value[i]["items_type"]}");
                                  },
                                  child: Text("${controller.items.value[i]["type_name"]}"),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Default sorting
                    CustomDialog(),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.specificItems.value.length,
                      itemBuilder: (context, i) {
                        return controller.specificItems.value[i]["items_discount"] == 0 &&
                            controller.specificItems.value[i]["items_active"] == 1
                            ? CustomItemForm(
                          itemsModel:
                          ItemsModel.fromJson(controller.specificItems.value[i]),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => ItemDescription(
                                    imageUrl:
                                    "${AppLinks.items}/${controller.specificItems.value[i]['items_image']}",
                                    itemCount: 5,
                                    discount: controller.specificItems.value[i]
                                    ["items_discount"],
                                    increaseFun: () {},
                                    decreaseFun: () {},
                                    name:
                                    "${controller.specificItems.value[i]["items_name"]}",
                                    description:
                                    "${controller.specificItems.value[i]["items_desc"]}",
                                    price: controller.specificItems.value[i]
                                    ["items_price"],
                                    newPrice: 0,
                                    totalPrice: 5.36,
                                    onTap: () {}));
                          },
                        )
                            : controller.specificItems.value[i]["items_discount"] > 0 &&
                            controller.specificItems.value[i]["items_active"] == 1
                            ? CustomItemWithDisCount(
                          updateprice: controller.updateprice(
                              controller.specificItems.value[i]["items_discount"],
                              controller.specificItems.value[i]["items_price"]),
                          itemsModel: ItemsModel.fromJson(
                              controller.specificItems.value[i]),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => ItemDescription(
                                    imageUrl:
                                    "${AppLinks.items}/${controller.specificItems.value[i]['items_image']}",
                                    itemCount: 5,
                                    discount: controller.specificItems.value[i]
                                    ["items_discount"],
                                    increaseFun: () {},
                                    decreaseFun: () {},
                                    name:
                                    "${controller.specificItems.value[i]["items_name"]}",
                                    description:
                                    "${controller.specificItems.value[i]["items_desc"]}",
                                    price: controller.specificItems.value[i]
                                    ["items_price"],
                                    newPrice: 0,
                                    totalPrice: 5.36,
                                    onTap: () {}));
                          },
                          price: controller.newprice!.value,
                        )
                            : controller.specificItems.value[i]["items_discount"] == 0 &&
                            controller.specificItems.value[i]["items_active"] == 0
                            ? CustomItemSoldOut(
                          itemsModel: ItemsModel.fromJson(
                              controller.specificItems.value[i]),
                        )
                            : controller.specificItems.value[i]["items_discount"] >
                            0 &&
                            controller.specificItems.value[i]
                            ["items_active"] ==
                                0
                            ? CustomItemDisCountSoldOut(
                          updatePrice: controller.updateprice(
                              controller.specificItems.value[i]
                              ["items_discount"],
                              controller.specificItems.value[i]
                              ["items_price"]),
                          price: controller.newprice!.value,
                          itemsModel: ItemsModel.fromJson(
                              controller.specificItems.value[i]),
                        )
                            : Text("data");
                      },
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.59),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}