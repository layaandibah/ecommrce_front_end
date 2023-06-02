import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applinks.dart';
import '../../../core/constant/routes.dart';

class CustomCategoryCard extends StatelessWidget {
  final void Function()? onTap;

 final CategoriesModel categoriesModel;
   CustomCategoryCard({Key? key,required this.onTap,required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 100,
        child: Card(
          child: Column(
            children: [
              Image.network(
                "${AppLinks.categories}/${categoriesModel.categoriesImage}",
                // fit: BoxFit.contain,
              ),
              Text(
                "${categoriesModel.categoriesName}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
