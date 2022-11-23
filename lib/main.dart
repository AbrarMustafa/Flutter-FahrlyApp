import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/screens/companyCodeScreen.dart';
import 'package:ffmbot_flutter/screens/homeScreen.dart';
import 'package:ffmbot_flutter/screens/messageScreen.dart';
import 'package:ffmbot_flutter/screens/nameScreen.dart';
import 'package:ffmbot_flutter/screens/splashWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ffmbot_flutter/screens/phoneAuthScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? prefs;
AddRiderResponce? getAccount;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashWidget(),
      '/signin': (context) => SignIn( ),
      '/name': (context) => NameScreen(),
      '/companycode': (context) => CompanyCodeScreen(),
      '/home': (context) => HomeScreen( ),
      '/message': (context) => MessageScreen( ),
    },
    debugShowCheckedModeBanner: false,
  ));
}