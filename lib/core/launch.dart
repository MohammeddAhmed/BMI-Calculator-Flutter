import 'package:bmi_calculator/const/constants.dart';
import 'package:flutter/material.dart';


class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, '/input_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomEnd,
            colors:[
              backgroundColor,
              inActiveColor,
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/bmi-logo.png'),
        ),
      ),
    );
  }
}
