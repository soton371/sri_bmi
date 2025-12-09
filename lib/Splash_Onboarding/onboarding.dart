// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/homepage.dart';
import '../constant.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    // Start a timer to toggle the visibility every 1 second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        isVisible = !isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/applogo.png",
            height: 205.h,
          ),
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Welcome to",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(48.0),
              fontFamily: 'RubikBold',
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'SHA',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    decoration: TextDecoration.none,
                    fontSize: ScreenUtil().setSp(48.0),
                    fontFamily: 'RubikBold',
                  ),
                ),
                TextSpan(
                  text: 'BMI',
                  style: TextStyle(
                    color: AppColors.redColor,
                    decoration: TextDecoration.none,
                    fontSize: ScreenUtil().setSp(48.0),
                    fontFamily: 'RubikBold',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.blueColor),
                    minimumSize: MaterialStatePropertyAll(
                      Size(300, 55),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Get.offAll(() => Homepage());
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(26.0),
                    fontFamily: 'RubikBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
