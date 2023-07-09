import 'package:bmi_calculator/Widgets/my_card.dart';
import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/My_Fab.dart';
import 'package:bmi_calculator/widgets/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool? isMale;
  int height = 180;
  int weight = 60;
  int age = 20;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bmi Calculator'.toUpperCase(),
          style: const TextStyle(fontSize: 24),

        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyCard(
                  onTap: () => setState(() => selectedGender = Gender.male),
                  color: selectedGender == Gender.male
                      ? activeColor
                      : inActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.mars,
                        size: 70,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Male'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyCard(
                  onTap: () => setState(() => selectedGender = Gender.female),
                  color: selectedGender == Gender.female
                      ? activeColor
                      : inActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.venus,
                        size: 70,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Female'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 24, color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: inActiveColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Height'.toUpperCase(),
                      style:
                      TextStyle(fontSize: 24, color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 54,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        inactiveTrackColor: activeColor,
                        trackHeight: 1,
                      ),
                      child: Slider(
                          max: 250,
                          min: 50,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() => height = value.round());
                          }),
                    ),
                  ],
                )),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: inActiveColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            color: activeColor,
                            icon: FontAwesomeIcons.minus,
                          ),
                          MyFab(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            color: activeColor,
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: inActiveColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        age.toString(),
                        // '$age',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            color: activeColor,
                            icon: FontAwesomeIcons.minus,
                          ),
                          MyFab(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            color: activeColor,
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              BMIBrain bmiBrain = BMIBrain(height, weight);
              bmiBrain.calculateBMI();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    ResultPage(bmiBrain: bmiBrain),
                ),
              );
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
                'Calculate Your Bmi'.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold,
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
