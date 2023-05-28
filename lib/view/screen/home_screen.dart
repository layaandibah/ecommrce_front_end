import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../widget/homepage/customdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("title"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
