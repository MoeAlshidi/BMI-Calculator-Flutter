import 'package:bmi_calculator/modules/constant.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.cardimage, required this.textcard});
  final IconData cardimage;
  final String textcard;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardimage,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          textcard,
          style: kTextcardStyle,
        ),
      ],
    );
  }
}
