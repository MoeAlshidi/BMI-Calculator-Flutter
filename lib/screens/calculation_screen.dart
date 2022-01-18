import 'package:bmi_calculator/modules/constant.dart';
import 'package:bmi_calculator/modules/reusable_card.dart';
import 'package:flutter/material.dart';

class ResualtsPage extends StatelessWidget {
  ResualtsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              colour: kColors,
              CardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: const Text(
                  "RE-CALCULATE",
                  style: kLargeButtonTextStyle,
                ),
                width: double.infinity,
                color: const Color(0xFFEB1555),
                margin: const EdgeInsets.only(top: 10),
                height: kBottomContainerHeight,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
