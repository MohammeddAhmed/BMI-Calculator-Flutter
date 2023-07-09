import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/core/launch.dart';
import 'package:bmi_calculator/pages/Input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: buttonColor,
              secondary: bColor,
            ),
      ),
      initialRoute: '/launch',
      routes: {
        '/launch': (context) => const Launch(),
        '/input_page': (context) => const InputPage(),
      },
    );
  }
}
