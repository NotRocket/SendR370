import 'package:first/Views/singup.dart';
import 'package:first/Widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:first/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/services/database.dart';
import 'package:first/Views/chatRoomsScreen.dart';


class SignIn extends StatefulWidget{
  @override

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signInWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null)  {
          QuerySnapshot userInfoSnapshot =
          await DatabaseMethods().getUserInfo(emailEditingController.text);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),

       body: SingleChildScrollView(
         child: Container(
           height: MediaQuery.of(context).size.height-50,
           alignment: Alignment.bottomCenter,
           child: Container(

             padding: EdgeInsets.symmetric(horizontal: 24),
             child: Column(
               mainAxisSize:MainAxisSize.min,
               children: [
                 Form(
                   key: formKey,
                   child: Column(
                     children: [
                       TextField(
                         controller:  emailEditingController,
                         style: simpleTextStyle(),
                         decoration: textFieldInputDecoration('username'),
                         ),
                       TextField(
                         controller: passwordEditingController,
                         style: simpleTextStyle(),
                         decoration: textFieldInputDecoration('password'),
                       ),
                       SizedBox(height: 8,),
                       Container(
                         alignment:  Alignment.centerRight,
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                           child: Text("Forgot Password?", style: simpleTextStyle(),),
                         ),
                       ),
                       SizedBox(height: 8,),
                       GestureDetector(
                         onTap: (){
                           signIn();
                         },
                         child: Container(
                           alignment: Alignment.center,
                           width: MediaQuery.of(context).size.width,
                           padding: EdgeInsets.symmetric(vertical: 20),
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                                 colors: [
                                   const Color(0xff007EF4),
                                   const Color(0xff2A75BC),
                                 ]
                             ),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child: Text("Sign In", style: mediumTextStyle(),),
                         ),
                       ),
                       SizedBox(height: 16,),
                       Container(
                         alignment: Alignment.center,
                         width: MediaQuery.of(context).size.width,
                         padding: EdgeInsets.symmetric(vertical: 20),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: Text("Sign In with Google", style: TextStyle(
                             color: Colors.black,
                             fontSize: 17
                         ),),
                       ),
                       SizedBox(height: 16,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Don't have account?", style: mediumTextStyle(),),
                           ElevatedButton(
                               child: FlatButton(
                                 onPressed: () {
                                   Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => SignUp()));
                                   // Navigate back to first route when tapped.
                                 },
                                 child: Text('Register Now',style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 17,
                                     decoration: TextDecoration.underline

                                 ),),
                           ),

                           ),
                         ]
                       ),
                       SizedBox(height: 50, ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
    );
  }
}