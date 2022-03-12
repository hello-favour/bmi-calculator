import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_flutter_demo/main.dart';
import 'package:navigation_flutter_demo/screens/results_page.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constant.dart';
import '../components/round_icon_button.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import 'package:navigation_flutter_demo/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class inputPage extends StatefulWidget {
  const inputPage({Key? key}) : super(key: key);

  @override
  State<inputPage> createState() => _inputPageState();
}

// Color maleCardColour = inactiveCardColour;
// Color femaleCardColour = inactiveCardColour;

// void updateColour(int Gender) {
//   if (Gender == 1) {
//     if (maleCardColour == inactiveCardColour) {
//       maleCardColour = activeCardColour;
//       femaleCardColour = inactiveCardColour;
//     } else {
//       maleCardColour = inactiveCardColour;
//     }
//   }
//   if (Gender == 2) {
//     if (femaleCardColour == inactiveCardColour) {
//       femaleCardColour = activeCardColour;
//       maleCardColour = inactiveCardColour;
//     } else {
//       femaleCardColour = inactiveCardColour;
//     }
//   }
// }

class _inputPageState extends State<inputPage> {
  Gender? selectedGender;
  void UpdateChanges(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  int height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text("Flutter Developer"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: ktextLabel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kcustomText,
                        ),
                        Text("cm", style: ktextLabel),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.amber,
                        activeTrackColor: Colors.white,
                        overlayColor: Colors.amberAccent,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Colors.white,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: ktextLabel),
                          Text(
                            weight.toString(),
                            style: kcustomText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: ktextLabel),
                          Text(age.toString(), style: kcustomText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 8.0),
                              RoundIconButton(
                                child: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATOR",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
            ),
          ],
        ));
  }
}
