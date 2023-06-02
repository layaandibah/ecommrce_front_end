import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomDeliveryTime extends StatelessWidget {
  final int groupVal;
  final String titleDay;
  final String titleTime;
  final void Function()? choseDayFun;
  final void Function()? choseTimeFun;
  final TextEditingController textFormFieldController;

  const CustomDeliveryTime({
    Key? key,
    required this.groupVal,
    required this.titleDay,
    required this.titleTime,
    required this.choseDayFun,
    required this.choseTimeFun,
    required this.textFormFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 142,
                child: RadioListTile(
                  value: 1,
                  groupValue: groupVal,
                  onChanged:(val){
                    groupVal!=val;
                  },
                  activeColor: AppColor.primarycolor,
                  title: const Text(
                    "ASAP",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                width: 148,
                child: RadioListTile(
                  value: 2,
                  groupValue: groupVal,
                  onChanged: (val){
                    groupVal!=val;
                  },
                  activeColor: AppColor.primarycolor,
                  title: const Text(
                    "Later",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
          groupVal > 1
              ? const Divider(
                  thickness: 1.5,
                )
              : const SizedBox(
                  height: 0,
                ),
          groupVal > 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      onPressed: choseDayFun,
                      child: Text(
                        titleDay,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.primarycolor),
                      ),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    MaterialButton(
                      onPressed: choseTimeFun,
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_downward),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.access_time),
                          Text(titleTime),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 0,
                ),
          const Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: TextFormField(
              controller: textFormFieldController,
              decoration: const InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.5, color: AppColor.primarycolor),
                ),
                hintText: "additional notes",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColor.primarycolor,
                )),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic),
                suffixIconColor: Colors.white54,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
