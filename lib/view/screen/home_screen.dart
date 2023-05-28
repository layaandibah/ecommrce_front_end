import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/appbar/customappbar_textformfield.dart';
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
        builder: (controller)=>HandlingDataView(statusrequest:controller.statusrequest, widget:Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: CustomFloatingActionButtonCoin(),
          appBar: AppBar(
            primary: true,
            leading: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: IconButton(icon:const Icon(Icons.notes,),onPressed: ()=>Scaffold.of(context).openDrawer(),),
                  );
                }
            ),
            backgroundColor: AppColor.primarycolor,
            actions: [
              InkWell(
                  onTap: () {
                    Get.offNamed(AppRoutes.successsignup);
                  },
                  child: CustomAppBarCartBox(count: 10))
            ],
            title:const Padding(
              padding:EdgeInsets.only(top: 25),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAsset.homeshope),
                Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,

                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 29,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                ImageAsset.logo,
                                height: 60,
                                width: 60,
                              ),
                              Text("food")
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, crossAxisSpacing: 5),
                  ),
                ),

              ],
            ),
          ),
          drawer: CustomDrawer(),
        )),
      ),
    );
  }
}
