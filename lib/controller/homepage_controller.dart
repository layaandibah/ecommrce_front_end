import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../data/model/itemsmodel.dart';

abstract class HomePageController extends GetxController {
  initialData();

  getData(String userId);

  updateprice(int discount, double price);

  goToItims(List<dynamic> categories, int selectedCat, String categoriesId);

  addToCart();
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  RxList responseitems=[].obs;
  int? id;
  int? discount;
  double? price;
  StatusRequest? statusrequest;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List allitemshome = [];
  double? newprice;
  int addtocart = 0;
  TextEditingController? searchitems;
  bool isSearch = false;
  late String userId;
  // List<ItemsModel> searchdata = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  getData(String userId) async {
    statusrequest = StatusRequest.loading;
    var res = await homeData.getData(userId);
    statusrequest = handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if (StatusRequest.success == statusrequest) {
      //فحص الفشل بالباك اند
      if (res["status"] == "success") {
        print("====================");
        categories.addAll(res["categories"]);
        allitemshome.addAll(res["items"]);
      } else {
        //يوجد مشكلة في الباك اند
        statusrequest = StatusRequest.nodata;
      }
    }
    update();
  }

  updateprice(int discount, double price) {
    newprice =
        double.parse((price - (price * discount / 100)).toStringAsFixed(2));
  }

  goToItims(categories, selectedCat, categoriesId) {
    Get.toNamed(AppRoutes.itemsscreen, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": categoriesId,
    });
  }

  addToCart() {
    addtocart++;
    print(addtocart);
    update();
  }

  cheackSearch(val) {
    if (val == "") {
      isSearch = false;
    }else{
      isSearch = true;
      searchData();
    }
    update();
  }

  searchData() async {
    statusrequest = StatusRequest.loading;
    var res = await homeData.searchdata(searchitems!.text);
    statusrequest = handlingData(res);
    //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
    if (StatusRequest.success == statusrequest) {
      //فحص الفشل بالباك اند
      if (res["status"] == "success") {
        print("====================");
         responseitems.clear();
         responseitems.addAll(res["data"]);
        // searchdata.addAll(responseitems.map((e) => ItemsModel.fromJson(e)));
      } else {
        //يوجد مشكلة في الباك اند
        statusrequest = StatusRequest.nodata;
      }
    }
  }

  onSearchitems() {
    isSearch = true;
    searchData();

  }

  @override
  void onInit() {
    searchitems = TextEditingController();
    userId="1";
    getData(userId);
    initialData();
    super.onInit();
  }
}
