// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            width: double.infinity,
            child: Image.asset(
              "assets/Footer_Image.png",
              fit: BoxFit.fitWidth,
            )));
  }
}
