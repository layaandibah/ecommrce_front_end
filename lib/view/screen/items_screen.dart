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
      child: GetBuilder<ItemsControllerImp>(
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
                    CustomListTypes(),
                    //Default sorting
                    CustomDialog(),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.items.length,
                      itemBuilder: (context, i) {
                        return controller.items[i]["items_discount"] == 0 &&
                                controller.items[i]["items_active"] == 1
                            ? CustomItemForm(
                                itemsModel:
                                    ItemsModel.fromJson(controller.items[i]),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) => ItemDescription(
                                          imageUrl:
                                              "${AppLinks.items}/${controller.items[i]['items_image']}",
                                          itemCount: 5,
                                          discount: controller.items[i]
                                              ["items_discount"],
                                          increaseFun: () {},
                                          decreaseFun: () {},
                                          name:
                                              "${controller.items[i]["items_name"]}",
                                          description:
                                              "${controller.items[i]["items_desc"]}",
                                          price: controller.items[i]
                                              ["items_price"],
                                          newPrice: 0,
                                          totalPrice: 5.36,
                                          onTap: () {}));
                                },
                              )
                            : controller.items[i]["items_discount"] > 0 &&
                                    controller.items[i]["items_active"] == 1
                                ? CustomItemWithDisCount(
                          updateprice:controller.updateprice(
                            controller.items[i]["items_discount"],
                            controller.items[i]["items_price"]) ,
                                    itemsModel: ItemsModel.fromJson(
                                        controller.items[i]),
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (_) => ItemDescription(
                                              imageUrl:
                                                  "${AppLinks.items}/${controller.items[i]['items_image']}",
                                              itemCount: 5,
                                              discount: controller.items[i]
                                                  ["items_discount"],
                                              increaseFun: () {},
                                              decreaseFun: () {},
                                              name:
                                                  "${controller.items[i]["items_name"]}",
                                              description:
                                                  "${controller.items[i]["items_desc"]}",
                                              price: controller.items[i]
                                                  ["items_price"],
                                              newPrice: 0,
                                              totalPrice: 5.36,
                                              onTap: () {}));
                                    },
                                    price: controller.newprice,
                                  )
                                : controller.items[i]["items_discount"] == 0 &&
                                        controller.items[i]["items_active"] == 0
                                    ? CustomItemSoldOut(
                                        itemsModel: ItemsModel.fromJson(
                                            controller.items[i]),
                                      )
                                    : controller.items[i]["items_discount"] > 0 && controller.items[i]["items_active"] == 0
                                        ? CustomItemDisCountSoldOut(
                          updatePrice: controller.updateprice(
                              controller.items[i]["items_discount"],
                              controller.items[i]["items_price"]),
                                            price: controller.newprice,
                                            itemsModel: ItemsModel.fromJson(
                                                controller.items[i]),
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
//   CustomItemForm(
//   itemsModel: ItemsModel.fromJson(controller.items[i]),
//   onTap: () {
//   showModalBottomSheet(
//   context: context,
//   isScrollControlled: true,
//   builder: (_) => ItemDescription(
//   imageUrl:
//   "${AppLinks.items}/${controller.items[i]['items_image']}",
//   itemCount: 5,
//   discount: controller.items[i]
//   ["items_discount"],
//   increaseFun: () {},
//   decreaseFun: () {},
//   name:
//   "${controller.items[i]["items_name"]}",
//   description:
//   "${controller.items[i]["items_desc"]}",
//   price: controller.items[i]["items_price"],
//   newPrice: 0,
//   totalPrice: 5.36,
//   onTap: () {}));
//   },
//   );
// },

// CustomItemSoldOut(
// itemsModel:
// ItemsModel.fromJson(controller.itemsSoldOut[i]),
// );

// CustomItemWithDisCount(
// itemsModel:
// ItemsModel.fromJson(controller.itemsdiscount[i]),
// onTap: () {
// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// builder: (_) => ItemDescription(
// imageUrl:
// "${AppLinks.items}/${controller.itemsdiscount[i]['items_image']}",
// itemCount: 5,
// discount: controller.itemsdiscount[i]
// ["items_discount"],
// increaseFun: () {},
// decreaseFun: () {},
// name:
// "${controller.itemsdiscount[i]["items_name"]}",
// description:
// "${controller.itemsdiscount[i]["items_desc"]}",
// price: controller.itemsdiscount[i]
// ["items_price"],
// newPrice: 0,
// totalPrice: 5.36,
// onTap: () {}));
// },
// price: controller.newprice,
// );
