import 'package:flutter/material.dart';

class CustomTotal extends StatelessWidget {
  final double totalUSD;
  final double totalLBP;
  const CustomTotal({Key? key, required this.totalUSD, required this.totalLBP}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                "TOTAL",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$totalUSD USD",
                style:const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$totalLBP LBP",textAlign: TextAlign.end,),
            ],
          ),
        ),
      ],
    );
  }
}
