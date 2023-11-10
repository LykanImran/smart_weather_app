import 'package:flutte_app/utils/constants.dart';
import 'package:flutte_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddressCard extends StatelessWidget {
  String location;
  AddressCard({super.key, this.location = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          location,
          style: appTitle.copyWith(fontSize: 26, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          width: 15,
        ),
        Lottie.asset(
          locationLot,
          height: 75,
          // width: 50,
          // height: 50,
          fit: BoxFit.fill,
        )
      ]),
    );
  }
}
