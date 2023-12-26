import 'dart:async';
import 'package:furniture_app/screens/onborading.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/Sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context,OnboardingView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: KprimaryColor,
                ),
                borderRadius: BorderRadius.circular(80),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.chair,
                size: 100,
                color: KprimaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'furniture App',
            style: TextStyle(
              color: KprimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Agbalumo',
            ),
          )
        ],
      ),
    );
  }
}
