import 'package:ecommerce/applinks.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
import 'package:ecommerce/view/widget/itemspage/customitemform.dart';
import 'package:ecommerce/view/widget/itemspage/customitemwithdiscount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              appBar: AppBar(
                primary: true,
                leading: Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notes,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
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
              body: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              Get.toNamed(AppRoutes.itemsscreen);
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
                                        "${controller.categories[i]["categories_name"]}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 5),
                      ),
                    ),
                   const SizedBox(
                      height: 17,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10),
                      child:const Text(
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
                      itemCount: controller.items.length,
                      itemBuilder: (context, i) {
                        controller.updateprice(controller.items[i]["items_discount"] ,controller.items[i]["items_price"]);

                        return CustomItemWithDisCount(
                          newprice:controller.newprice! ,
                          discount:controller.items[i]["items_discount"] ,
                          itemCount: controller.items.length,
                          imageUrl:
                          "${AppLinks.items}/${controller.items[i]['items_image']}",
                          itemName: "${controller.items[i]["items_name"]}",
                          description: '${controller.items[i]["items_desc"]}',
                          price: controller.items[i]["items_price"],
                        );
                      },
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.59),
                    )
                  ],
                ),
              ),
              drawer: CustomDrawer(),
            ));
        },
      ),
    );
  }
}
