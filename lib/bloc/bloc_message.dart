import 'dart:async';

import 'package:ffmbot_flutter/models/rider/getMessageModel.dart';

class MessageBloc{

  //-------------------------------------- SELECTIONS -------------------------------------//
  // selection
  // final selectMessageTypeStreamController = StreamController<MessageStatus>.broadcast();
  // StreamSink<MessageStatus> get selectMessageType_sink => selectMessageTypeStreamController.sink;
  // Stream<MessageStatus> get selectMessageType_counter => selectMessageTypeStreamController.stream;
  //
  // selectMessageType(MessageStatus messageStatus){
  //   selectMessageType_sink.add(messageStatus);
  // }

  //-------------------------------------- HTTP REQUESTS -------------------------------------//
  //get messages
  final getMessageStreamController = StreamController<List<GetMessageResponce>>.broadcast();
  StreamSink<List<GetMessageResponce>> get getMessage_sink => getMessageStreamController.sink;
  Stream<List<GetMessageResponce>> get getMessage_counter => getMessageStreamController.stream;

  refreshMessages(List<GetMessageResponce> messages){
    getMessage_sink.add(messages);
  }

}

final MessageBloc messageBloc=new MessageBloc();