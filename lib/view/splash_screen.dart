import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart'; // Import the HomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(), // Navigate to HomeScreen
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash1.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Align(
            child: Image.asset(
              'assets/images/splash2.png',color: Colors.white,
              filterQuality: FilterQuality.high,
            ),
          ),
          Align(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/tarneeb.jpg', width: 300,height: 100, ),
                const SizedBox(height: 10,),
                const Text('Tarneeb Counter',
                  style: TextStyle(fontSize: 24, color: Colors.teal,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


