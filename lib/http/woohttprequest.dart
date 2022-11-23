import 'package:ffmbot_flutter/main.dart';
import 'package:ffmbot_flutter/models/rider/addRiderRequestModel.dart';
import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/models/rider/getMessageModel.dart';
import 'package:ffmbot_flutter/toast.dart';
import 'package:ffmbot_flutter/utils/consts.dart';
import 'package:ffmbot_flutter/utils/prefrences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class WooHttpRequest {

  //---------------------------------------API SERVER-----------------------------------------------------//


  Future<AddRiderResponce?> addRider(AddRiderRequest addRiderRequest) async {

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var body = json.encode(addRiderRequest.toJson());
    final response = await http.post(Uri.parse(API_URL+API_ACCOUNT+"rider"),headers: headers ,body: body);


    print(response.body);

    if (response.statusCode == 200||response.statusCode == 201) {
      var responseJson = json.decode(response.body);
      AddRiderResponce addRiderResponce=AddRiderResponce.fromJson(responseJson);
      setAccountPref(addRiderResponce);
      return addRiderResponce;
    } else {
      var responseJson = json.decode(response.body);
      showToast(responseJson["message"]);
      return null;
    }
  }

  Future<GetMessageResponce?> getMessages() async {
    AddRiderResponce _getAccountPref=getAccountPref();
    if(_getAccountPref.id!="") {
      Map<String, String> headers = {
        "Accept": "application/json",
      };

      final response = await http.post(
          Uri.parse(API_URL + API_UBER), headers: headers, body: {
        "rider_id": _getAccountPref.id
      });

      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.body);
        GetMessageResponce getMessageResponce = GetMessageResponce.fromJson(
            responseJson);
        return getMessageResponce;
      } else {
        var responseJson = json.decode(response.body);
        showToast(responseJson["message"]);
        return null;
      }
    }else {

      return null;
    }
  }

}