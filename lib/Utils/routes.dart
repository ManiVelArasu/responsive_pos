import 'package:flutter/cupertino.dart';
import 'package:responsive_design/view/auth_screen/signup_screen.dart';

import '../view/home_screen.dart';
import '../view/auth_screen/login_screen.dart';


enum AppRoutes {
  loginScreen,
  homeScreen,
  signupScreen


}

var routes = {
  AppRoutes.loginScreen.name: (context) => const LoginScreen(),
  AppRoutes.homeScreen.name: (context) => const HomeScreen(),
  AppRoutes.signupScreen.name: (context) => const SignupScreen(),

};
