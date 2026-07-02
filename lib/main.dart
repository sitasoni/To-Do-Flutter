import 'package:flutter/material.dart';
import 'Widget/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do Master",
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
        brightness: Brightness.light
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext ctx) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Center(child: Text("Test")), backgroundColor: Colors.red),
        body: SplashScreen(),
      ),
    );
  }
}
