import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
            size: 25,
          ),
        ),
        backgroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.account_circle),
              title: Text("User Name"),
              children: [
                ListTile(
                  title: const Text(
                    "My Account",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "My Address",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "My Orders",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
            ),
            Container(
              color: AppColor.wightpurble,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyIconButton(
                    icon: Icons.star_border,
                    text: "FAVORITES",
                    onPressed: () {},
                  ),
                  MyIconButton(
                    icon: Icons.note_alt_outlined,
                    text: "ORDERS",
                    onPressed: () {},
                  ),
                  MyIconButton(
                    icon: Icons.replay,
                    text: "RE-ORDERS",
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            Container(
                height: 550,
                child: ListView.builder(itemBuilder: (context, index) {
                  return null;
                })),
          ],
        ),
      ),
    ));
  }
}

class MyIconButton extends StatelessWidget {
  IconData icon;
  String text;
  void Function()? onPressed;

  MyIconButton(
      {required this.icon,
      required this.text,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 80,
        width: 60,
        color: AppColor.wightpurble,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
