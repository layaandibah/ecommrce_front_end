import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
import 'package:ecommerce/view/widget/itemspage/Customitemdiscountsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/costomitemsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/customitemform.dart';
import 'package:ecommerce/view/widget/itemspage/customitemwithdiscount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/appbar/customappbar.dart';
import '../widget/appbar/customappbar_cart.dart';
import '../widget/floatingactionbutton/customfloatingactionbuttoncoin.dart';
import '../widget/homepage/customdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    int? lbp = 1;
    int? usd = 42567;
    return SafeArea(
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) {
          return HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniEndFloat,
                floatingActionButton: CustomFloatingActionButtonCoin(),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomAppBar(cartCount:"${controller.addtocart}",
                          formFaildText: "search items",
                          onpressedCart: () {
                          Get.toNamed(AppRoutes.cartscreen);
                          },
                          onPressedIcon: () {},
                        ),
                        Image.asset(ImageAsset.homeshope),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  controller.goToItims(controller.categories, i, "${controller.categories[i]["categories_id"]}" );
                                },
                                child: Container(
                                  width: 300,
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "${AppLinks.categories}/${controller.categories[i]['categories_image']}",
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          "${controller.categories[i]["categories_name"]}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, crossAxisSpacing: 5),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10),
                          child: const Text(
                            "Promotion",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.itemsdiscount.length,
                          itemBuilder: (context, i) {
                            controller.updateprice(
                                controller.itemsdiscount[i]["items_discount"],
                                controller.itemsdiscount[i]["items_price"]);

                            return CustomItemWithDisCount(
                              price:controller.newprice ,
                             onTap: (){},
                              itemsModel: ItemsModel.fromJson(controller.itemsdiscount[i]),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.59),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.itemsSoldOut.length,
                          itemBuilder: (context, i) {
                            return CustomItemSoldOut(

                              itemsModel: ItemsModel.fromJson(controller.itemsSoldOut[i]),
                            );
                          },
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.59),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.itemsdiscountsoldout.length,
                          itemBuilder: (context, i) {
                            controller.updateprice(
                                controller.itemsdiscountsoldout[i]["items_discount"],
                                controller.itemsdiscountsoldout[i]["items_price"]);
                            return CustomItemDisCountSoldOut(
                              price: controller.newprice,
                              itemsModel: ItemsModel.fromJson(controller.itemsdiscountsoldout[i]),
                            );
                          },
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.59),
                        )
                      ],
                    ),
                  ),
                ),
                drawer: CustomDrawer(),
              ));
        },
      ),
    );
  }
}
