import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/itemspage/Customitemdiscountsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/costomitemsoldout.dart';
import 'package:ecommerce/view/widget/itemspage/customitemform.dart';
import 'package:ecommerce/view/widget/itemspage/customitemwithdiscount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applinks.dart';
import '../../screen/item_description.dart';

class CustomItemsScreen extends StatelessWidget {

  final ItemsModel itemsModel;
  final bool isHome;
  final dynamic updateprice;
  final double newprice;

  const CustomItemsScreen(
      {Key? key,
      required this.itemsModel,
      required this.updateprice,
      required this.newprice, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  itemsModel.itemsDiscount == 0 && itemsModel.itemsActive == 1 && isHome==true
            ? CustomItemForm(onTap:() {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) =>
                  ItemDescription(
                      imageUrl:
                      "${AppLinks.items}/${itemsModel.itemsImage}",
                      itemCount: 5,
                      discount:itemsModel.itemsDiscount!,
                      increaseFun: () {},
                      decreaseFun: () {},
                      name:
                      "${itemsModel.itemsName}",
                      description:
                      "${itemsModel.itemsDesc}",
                      price: itemsModel.itemsPrice!,
                      newPrice: newprice,
                      totalPrice: 5.36,
                      onTap: () {}));
        }, itemsModel: itemsModel)
            : itemsModel.itemsDiscount! > 0 && itemsModel.itemsActive == 1
                ? CustomItemWithDisCount(
                    updateprice: updateprice,
                    price: itemsModel.itemsPrice,
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => ItemDescription(
                              imageUrl:
                                  "${AppLinks.items}/${itemsModel.itemsImage}",
                              itemCount: 5,
                              discount: itemsModel.itemsDiscount!,
                              increaseFun: () {},
                              decreaseFun: () {},
                              name: "${itemsModel.itemsName}",
                              description: "${itemsModel.itemsDesc}",
                              price: itemsModel.itemsPrice!,
                              newPrice: newprice,
                              totalPrice: 5.36,
                              onTap: () {}));
                    },
                    itemsModel: itemsModel)
                : itemsModel.itemsDiscount! >  0 && itemsModel.itemsActive == 0
                    ? CustomItemDisCountSoldOut(
                        price: newprice,
                        itemsModel: itemsModel,
                        updatePrice: updateprice)
                    : itemsModel.itemsDiscount == 0 && itemsModel.itemsActive == 0
                        ? CustomItemSoldOut(itemsModel: itemsModel)
                        : Text("data");

  }
}

