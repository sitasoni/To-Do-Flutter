import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_master/Widget/TodoScreen.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)); // old
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 100),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Hey, Start you day!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // Image.asset(
              //   "assets/todo.jpg",
              //   fit: BoxFit.cover,
              //   color: Colors.black.withOpacity(0.5),
              //   colorBlendMode: BlendMode.multiply,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
