import 'package:flutter/material.dart';
import 'package:first/services/auth.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png",
          height: 50,),
        actions: [

        ],
      ),
    );
    return Container();
  }
}
