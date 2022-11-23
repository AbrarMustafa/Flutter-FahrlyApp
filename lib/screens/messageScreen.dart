import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:ffmbot_flutter/screens/splashWidget.dart';
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


class MessageScreen extends StatefulWidget  {
  WebSocketChannel? _channel ;

  @override
  _MessageScreenState createState() => new _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>with SingleTickerProviderStateMixin {
  List<GetMessageResponce> messages = [];
  final streamController = StreamController.broadcast();

  List<_Page>? _allPages;
  TabController? _controller;
  @override
  void initState() {
    super.initState();

    widget._channel = WebSocketChannel.connect(Uri.parse('$WS_URL?${getAccount!.id}'),);
    streamController.addStream(widget._channel!.stream);

    _allPages = <_Page>[
      _Page(icon: Icons.grade, text: 'Heute', index: 0),
      _Page(icon: Icons.playlist_add, text: 'Geschichte', index: 1)
    ];
    _controller = TabController(vsync: this, length: 2);
  }


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.1,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            getAccount!.company.capitalize(),
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
          ),
          bottom: TabBar(
              controller: _controller,
              tabs: _allPages!.map<Widget>((_Page page) {
                return Tab(
                    icon: Text(
                      page.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color(0xFF0CB86F)
                      ),
                    )
                );
              }).toList()
          ),
        ),
        drawer: getDrawer(context),
        body: Container(
          child: TabBarView(
            controller: _controller,
            children: _allPages!.map<Widget>((_Page page) {
              return SafeArea(
                  child: page.index==0?getFilteredMessages(true):page.index==1?getFilteredMessages(false):Container()
              );
            }).toList(),
          ),
        ),
      ),

    );
  }


  Widget getFilteredMessages(bool isToday) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map data = json.decode(snapshot.data.toString());
                List responseJson = data["data"];
                List<GetMessageResponce> _messagesInstance = responseJson.map((
                    data) => GetMessageResponce.fromJson(data)).toList();
                _messagesInstance.forEach((element) {
                  bool alreadyExist = messages.firstWhereOrNull((
                      _element) => _element.id == element.id) != null;
                  if (!alreadyExist)
                    messages.add(element);
                });
              }
              List<GetMessageResponce> filteredData=[];
              messages.forEach((element) {
                DateTime now = new DateTime.now();
                DateTime messageTime =  DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(element.createdAt);
                int differenceDays=now.difference(messageTime).inDays;
                if(isToday && differenceDays <= 1)
                  filteredData.add(element);
                if(!isToday && differenceDays > 1)
                  filteredData.add(element);
              });

              if (filteredData.isEmpty)
                return Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  alignment: Alignment.center,
                child: Text(
                  "Du hast noch keine Fahrten erhalten.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black
                  ),
                )
                );

              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.7,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: filteredData.map((item) =>
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(top: 15,right: 25,left: 25,bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.price +'-'+ getAccount!.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text(
                                    "Von: " + item.pickup_address,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text(
                                    "To: " + item.dropoff_address,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black
                                    ),
                                  ),
                                 Container(
                                   alignment: Alignment.centerRight,
                                   child: Text(
                                     item.time,
                                     style: TextStyle(
                                         fontSize: 14.0,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.green
                                     ),
                                   ),
                                 )
                                ],
                              )

                          )
                      )).toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    widget._channel!.sink.close();
    super.dispose();
  }


}
class _Page {
  const _Page({ required this.icon, required this.text, required this.index});
  final IconData icon;
  final String text;
  final int index;

}