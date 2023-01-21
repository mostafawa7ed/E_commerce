import 'package:app/core/constant/Colors.dart';
import 'package:app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Blocs/pagecounter/export_page_counter.dart';
import 'core/constant/approute.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCouterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-CommerceApp",
        theme: ThemeData(
          fontFamily: "PlayfairDisplay",
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black),
              displaySmall:
                  TextStyle(height: 2, color: AppColor.black54, fontSize: 17)),
        ),
        //home: const OnBoading(),
        initialRoute: AppRoute.signin,
        routes: route,
      ),
    );
  }
}
