import 'package:app/views/screens/OnBoading.dart';
import 'package:app/views/screens/auth/signin.dart';
import 'package:flutter/material.dart';

import 'core/constant/approute.dart';
import 'views/screens/auth/login.dart';

Map<String, Widget Function(BuildContext)> route = {
  AppRoute.login: (context) => LogIn(),
  AppRoute.home: (context) => const OnBoading(),
  AppRoute.signin: (context) => SignIn(),
};
