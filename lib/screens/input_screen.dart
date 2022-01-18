import 'package:bmi_calculator/modules/cal_brain.dart';
import 'package:bmi_calculator/modules/constant.dart';
import 'package:bmi_calculator/modules/icon_content.dart';
import 'package:bmi_calculator/modules/reusable_card.dart';
import 'package:bmi_calculator/screens/calculation_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kColors
                        : kInactivecolor,
                    CardChild: IconContent(
                      cardimage: FontAwesomeIcons.mars,
                      textcard: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kColors
                        : kInactivecolor,
                    CardChild: IconContent(
                      cardimage: FontAwesomeIcons.venus,
                      textcard: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              colour: kInactivecolor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kTextcardStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kTextNumberStyle,
                      ),
                      const Text(
                        'cm',
                        style: kTextcardStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    colour: kInactivecolor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kTextcardStyle,
                        ),
                        Text(
                          "$weight",
                          style: kTextNumberStyle,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              elevation: 6,
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                                size: 25,
                              ),
                              color: const Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            MaterialButton(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              elevation: 6,
                              color: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    colour: kInactivecolor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kTextcardStyle,
                        ),
                        Text(
                          "$age",
                          style: kTextNumberStyle,
                        ),
                        Row(
                          children: [
                            MaterialButton(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              elevation: 6,
                              color: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            MaterialButton(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              elevation: 6,
                              color: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResualtsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "CALCULATE",
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
