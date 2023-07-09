import 'package:bmi_calculator/Widgets/my_card.dart';
import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/widgets/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_buttons.dart';

class ResultPage extends StatefulWidget {
  final BMIBrain bmiBrain;

  const ResultPage({Key? key, required this.bmiBrain}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  void showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Success',
      text: 'Your data has been saved successfully',
      confirmBtnText: 'Done',
      confirmBtnColor: Colors.greenAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi Calculator'.toUpperCase(),
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: MyCard(
              color: Colors.white10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.bmiBrain.checkBMIResult(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    widget.bmiBrain.result.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.bmiBrain.bmiInterpretations(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        padding: const EdgeInsets.all(30),
                    ),
                    onPressed: () => showAlert(),
                    child: Text(
                      'Save Result'.toUpperCase(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.pop(context);
              });
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: buttonColor,
              ),
              child: Text(
                'RE-Calculate Your Bmi'.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
