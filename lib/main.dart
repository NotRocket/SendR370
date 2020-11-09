import 'package:firebase_core/firebase_core.dart';
import 'package:first/Views/signin.dart';
import 'package:first/Views/singup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first/Views/home.dart';
import 'package:first/services/auth.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider<AuthMethods>(
      create:(context)=> AuthMethods(),
      child:MaterialApp(

          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blue,
            primarySwatch: Colors.brown,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:  SignIn()
      )
      );
  }
}
/*

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final AuthMethods auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, AsyncSnapshot<String> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final bool signedIn = true;
          return  Home();
        }
        return CircularProgressIndicator();
      },
    );
  }
}*/

