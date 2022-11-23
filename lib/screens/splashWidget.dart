import 'dart:async';

import 'package:ffmbot_flutter/main.dart';
import 'package:ffmbot_flutter/models/rider/addRiderRequestModel.dart';
import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/utils/appTheme.dart';
import 'package:ffmbot_flutter/utils/prefrences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashWidget extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashWidget> with SingleTickerProviderStateMixin {

  startTime() async {
    var _duration = new Duration(milliseconds: 3500);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(prefs!=null) {
      AddRiderResponce getAccount=getAccountPref();
      if(getAccount!=null && getAccount.id!=null && getAccount.id!="")
        Navigator.pushReplacementNamed(context, "/message");
      else
        Navigator.pushReplacementNamed(context, "/signin");
    }
  }

  Future getPrefences() async{
    prefs = await SharedPreferences.getInstance();
    return null;
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();

  }

  @override
  Widget build(BuildContext context) {

     if(prefs==null) {
       getPrefences().then((value) {
         setState(() {});
       });
     }
     else {
       getAccount = getAccountPref();

       startTime();
     }

       return Container(
         child: Image.asset(
           'assets/splash.png',
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width ,
         ),
       );
  }

}