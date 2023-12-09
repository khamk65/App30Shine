import 'dart:convert';
import 'package:appdanhgia/screen/EmotionScreen.dart';
import 'package:appdanhgia/screen/EndScreen.dart';
import 'package:appdanhgia/screen/home.dart';
import 'package:appdanhgia/screen/rate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


