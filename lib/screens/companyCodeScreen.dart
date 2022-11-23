import 'package:ffmbot_flutter/http/woohttprequest.dart';
import 'package:ffmbot_flutter/models/rider/addRiderRequestModel.dart';
import 'package:flutter/material.dart';


class CompanyCodeScreen extends StatefulWidget {
  const CompanyCodeScreen({Key? key}) : super(key: key);

  @override
  _CompanyCodeScreenState createState() => _CompanyCodeScreenState();
}

TextEditingController codeController = TextEditingController();
class _CompanyCodeScreenState extends State<CompanyCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(codeController.text!="") {
              // Map map={"token":"adsf","name":"","phoneNumber":"",};
              Map map = ModalRoute
                  .of(context)!
                  .settings
                  .arguments as Map;
              WooHttpRequest().addRider(AddRiderRequest( map['token'], "", "",  map['name'],  map['phoneNumber'], codeController.text )).then((value) {
                if (value != null) {
                  Navigator.pushReplacementNamed(context, "/home");
                }
              });
            }
          },
          backgroundColor: const Color(0xFF0CB86F),
          child: const Icon(Icons.navigate_next),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.85,
            padding: const EdgeInsets.only(top: 120,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Text(
                    'Bitte gib den Aktiverungscode von für dein Unternehmen ein.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: TextFormField(
                    controller: codeController,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'Brauchst du hilfe? @fahrly_support auf Telegram',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        )
    ) ;
  }
}