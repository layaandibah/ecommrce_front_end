import 'package:flutter/material.dart';

class CustomLocation extends StatelessWidget {
  final String addressNickname;
  final String city;
  final String streetAndAddressDetails;

  const CustomLocation(
      {Key? key,
      required this.addressNickname,
      required this.city,
      required this.streetAndAddressDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressNickname,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text("$city, $streetAndAddressDetails"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.edit_location_alt),
                    const Text("Edit Location"),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_location_alt,
                    ),
                    const Text("Add Location"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
