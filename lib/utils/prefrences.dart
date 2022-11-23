import 'dart:convert';

import 'package:ffmbot_flutter/main.dart';
import 'package:ffmbot_flutter/models/rider/addRiderRequestModel.dart';
import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/utils/consts.dart';

//------------------------------------Rider -------------------------------//
setAccountPref(AddRiderResponce? createCustomer) {
  if(createCustomer==null)
    prefs!.remove(ACCOUNT );
  else
    prefs!.setString(ACCOUNT,json.encode(createCustomer.toJson()) );
}

AddRiderResponce getAccountPref() {
  String createCustomerPref=prefs!.getString(ACCOUNT) ?? json.encode( AddRiderResponce("", "", "",).toJson());

  var responseJson = json.decode(createCustomerPref);
  AddRiderResponce addRider=AddRiderResponce.fromJson(responseJson);

  return addRider;
}