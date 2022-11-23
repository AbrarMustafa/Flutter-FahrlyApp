
import 'package:collection/collection.dart';
import 'package:ffmbot_flutter/models/rider/addRiderResponceModel.dart';
import 'package:ffmbot_flutter/utils/consts.dart';
import 'package:ffmbot_flutter/utils/extentions.dart';
import 'package:ffmbot_flutter/utils/prefrences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget getDrawer(BuildContext context) {
  AddRiderResponce _getAccountPref = getAccountPref();
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/profile.png',
                height: 60,
                width: 60,
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getAccountPref.name.capitalize(),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    ),
                  ),
                  Text(
                    _getAccountPref.company.capitalize(),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    ),
                  )
                ],
              )

            ],
          ),
        ),
        // ListTile(
        //   title: const Text('Zuhause'),
        //   onTap: () {
        //     Navigator.pushReplacementNamed(context, "/home");
        //   },
        // ),
        ListTile(
          title: const Text('Deine Fahrten'),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/message");
          },
        ),
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50.0,
                  width: 120.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: new BorderRadius.all(
                              Radius.circular(40.0))
                      ),
                      child: ListTile(
                        title:  new Text(
                          "Abmelden",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white
                          ),
                        ),
                        onTap: () {
                          setAccountPref(null);
                          Navigator.pushReplacementNamed(context, "/signin");
                        },
                      ),
                  ),
                ), Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      alignment: Alignment.bottomCenter,
                      child: ListTile(
                        title: const Text('Legal'),
                        onTap: () {

                        },
                      ),
                    ),
                    Container(
                      width: 90,
                      alignment: Alignment.bottomCenter,
                      child: ListTile(
                        title: const Text('v 1.0'),

                      ),
                    )
                  ],
                )
              ],
            )

        )
      ],
    ),
  );
}