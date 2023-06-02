import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class CustomCart extends StatelessWidget {
  final int itemCount;
  final String name;
  final String description;
  final double price;
  final void Function()? decreaseFun;
  final void Function()? increaseFun;
  final void Function()? deleteFun;
  final void Function()? editFun;
  final String imageUrl;
  final double totalPrice;

  const CustomCart(
      {Key? key,
      required this.itemCount,
      required this.name,
      required this.description,
      required this.price,
      required this.decreaseFun,
      required this.increaseFun,
      required this.deleteFun,
      required this.editFun,
      required this.imageUrl,
      required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      color: AppColor.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$itemCount",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 0,
                          color: AppColor.primarycolor,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(height: 0),
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                                height: 0,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$price USD",
                            style: const TextStyle(height: 0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: decreaseFun,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        )),
                    Text(
                      "$itemCount",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          height: 0,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: increaseFun,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        )),
                    IconButton(
                        onPressed:(){
                          showDialog(context: context, builder:(_){
                            return AlertDialog(
                              title: const Text("DELETE ITEM FROM BAG"),
                              contentPadding:const EdgeInsets.symmetric(vertical: 25),
                              content: SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                   const Text(
                                      "Are you sure you want to delete this item?",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        MaterialButton(
                                          onPressed:(){
                                            deleteFun;
                                            Get.back();
                                          },
                                          padding:EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            height: 60,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: AppColor.primarycolor,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child:const Center(child: Text("DELETE",style: TextStyle(color: Colors.white),)),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed:(){
                                            Get.back();
                                          },
                                          padding:EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            height: 60,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: AppColor.primarycolor),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child:const Center(child: Text("CANCEL",style: TextStyle(color: AppColor.primarycolor),)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        )),
                    IconButton(
                        onPressed: editFun,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: ImageAsset.loadingPicture,
                placeholderCacheHeight: 100,
                placeholderCacheWidth: 120,
                placeholderFit: BoxFit.fill,
                image: imageUrl,
                height: 100,
                width: 120,
                fit: BoxFit.fill,
              ),
              Text(
                "$totalPrice USD",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
