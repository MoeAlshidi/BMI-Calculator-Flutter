import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer(
      {required this.colour, required this.CardChild, required this.onPress});
  final Color colour;
  final Widget CardChild;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: CardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
