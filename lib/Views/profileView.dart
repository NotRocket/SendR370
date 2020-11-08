import 'package:first/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:first/services/auth.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthMethods auth;

  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthMethods>(context);
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: auth.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData)
                    return Text("${snapshot.data.displayName}");
                  else
                    return Center(child: Text('Something Wrong'));
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
