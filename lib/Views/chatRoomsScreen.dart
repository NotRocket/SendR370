import 'package:first/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:first/services/auth.dart';
import 'package:first/Views/search.dart';
import 'package:first/helper/helperfunctions.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  void initState(){
    getUserInfo();
    super.initState();
  }


  getUserInfo() async{
    Constants.myName = await HelperFunctions.getUserNameInSharedPrefrence();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/search.png",
          height: 0, ),
        actions: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SearchScreen()
          ));
        },
      ),



    );

  }
}
