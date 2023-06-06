import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
import 'package:ecommerce/view/widget/itemspage/customitemsscreen.dart';
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

    HomePageControllerImp controllerImp = Get.put(HomePageControllerImp());
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
                    onChanged: (String) {},
                    controller: null,
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
                                    controller.catId, "-1");
                              },
                              child: const Text("All"),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.items.value.length,
                              itemBuilder: (context, i) {
                                return MaterialButton(
                                  onPressed: () {
                                    controller.getSpecificItems(
                                        "${controller.items.value[i]["categories_id"]}",
                                        "${controller.items.value[i]["items_type"]}");
                                  },
                                  child: Text(
                                      "${controller.items.value[i]["type_name"]}"),
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
                    !controllerImp.isSearch == true
                        ?GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 0.59),
                      itemCount: controller.specificItems.value.length,
                      itemBuilder: (context, i) {
                        return CustomItemsScreen(
                            isHome: true,
                            itemsModel: ItemsModel.fromJson(
                                controller.specificItems.value[i]),
                            updateprice: controller.updateprice(
                                controller.specificItems.value[i]
                                ["items_discount"],
                                controller.specificItems.value[i]
                                ["items_price"]),
                            newprice:controller.newprice!.value);
                      },
                    )
                        :GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: 0.59),
                      itemCount: controllerImp.responseitems.value.length,
                      itemBuilder: (context, i) {
                        return CustomItemsScreen(
                            isHome: true,
                            itemsModel: ItemsModel.fromJson(
                                controllerImp.responseitems.value[i]),
                            updateprice: controller.updateprice(
                                controllerImp.responseitems.value[i]
                                ["items_discount"],
                                controllerImp.responseitems.value[i]
                                ["items_price"]),
                            newprice:controllerImp.newprice!);
                      },
                    )  ,
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

