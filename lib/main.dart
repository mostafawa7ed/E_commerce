import 'package:app/views/screens/OnBoading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: "E-CommerceApp",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnBoading(),
    );
  }
}
