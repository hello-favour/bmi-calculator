import 'package:flutter/material.dart';
import 'package:navigation_flutter_demo/components/bottom_button.dart';
import 'package:navigation_flutter_demo/constant.dart';
import 'package:navigation_flutter_demo/components/reusable_card.dart';
import 'package:navigation_flutter_demo/screens/input.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
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
        backgroundColor: Colors.black54,
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  Text(
                    bmiResult,
                    style: kMBITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: "RE_CALCULATE"),
        ],
      ),
    );
  }
}
