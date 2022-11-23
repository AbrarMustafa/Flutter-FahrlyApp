import 'package:ffmbot_flutter/http/woohttprequest.dart';
import 'package:ffmbot_flutter/models/rider/addRiderRequestModel.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
const NameScreen({Key? key}) : super(key: key);

@override
_NameScreenState createState() => _NameScreenState();
}

TextEditingController nameController = TextEditingController();
class _NameScreenState extends State<NameScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(nameController.text!="") {
              Map map = ModalRoute.of(context)!.settings.arguments as Map;
              Navigator.pushReplacementNamed(context, "/companycode",
                  arguments: {
                    'token': map['token'],
                    "phoneNumber": map['phoneNumber'],
                    "name": nameController.text
                  });
            }
          },
          backgroundColor: const Color(0xFF0CB86F),
          child: const Icon(Icons.navigate_next),
        ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 120,left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: const Text(
                      'Wie ist dein Name?',
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
                      controller: nameController,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
      ) ;
  }
}