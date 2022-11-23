import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:ffmbot_flutter/utils/commonWidget.dart';
import 'package:ffmbot_flutter/utils/extentions.dart';
import 'package:ffmbot_flutter/utils/prefrences.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:ffmbot_flutter/http/woohttprequest.dart';
import 'package:ffmbot_flutter/main.dart';
import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/models/rider/getMessageModel.dart';
import 'package:ffmbot_flutter/utils/appTheme.dart';
import 'package:ffmbot_flutter/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class HomeScreen extends StatefulWidget  {

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    AddRiderResponce _getAccountPref = getAccountPref();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          _getAccountPref.company.capitalize(),
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
          ),
        ),
      ),
      drawer: getDrawer(context),
      body: const SafeArea(
          child: Text("WellCome"),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}