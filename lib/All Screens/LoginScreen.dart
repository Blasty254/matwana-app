
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matwana_app/All%20Screens/RegistrationForms.dart';
import 'package:matwana_app/All%20Screens/mainscreen.dart';
import 'package:matwana_app/AllWidgets/progressDialog.dart';
import 'package:matwana_app/main.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "Login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 35.0,),
                Image(
                    image: AssetImage("images/matwanalogo.png"),
                    width: 350.0,
                  height: 350.0,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 1.0,),
                Text(
                  "Login As A Driver",
                  style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [

                        SizedBox(height: 1.0,),
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.blueGrey,
                              )
                          ),
                          style: TextStyle(fontSize: 25.0),

                        ),

                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.blueGrey,
                              )
                          ),
                          style: TextStyle(fontSize: 25.0),

                        ),
                        SizedBox(height: 20.0,),
                        RaisedButton(
                          color: Colors.amberAccent,
                          textColor: Colors.white,
                          child: Container(
                            height: 50.0,
                            child: Center(
                               child: Text(
                                 "LogIn",
                                 style: TextStyle(fontSize: 18.0,fontFamily: "Brand Bold"),

                               ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed:(){
                            if(!emailTextEditingController.text.contains("@"))
                            {
                              displayToastMessage("Email address is not valid", context);
                            }
                            else if(passwordTextEditingController.text.isEmpty)
                            {
                            displayToastMessage("Password is required", context);
                            }
                            else
                              {
                                loginAndAuthenticateUser(context);
                              }
                          },

                        ),
                      ],

                    ),

                ),
                    FlatButton(
                        onPressed:()
                        {
                          Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                        },
                        child:Text(
                          "Do not have an account ?Register Here",
                        )
                        ),
              ],
            ),
          ),
        ),
      ),

    );
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context)async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Authenticating,Please wait...",);
        }

    );


    final User firebaseUser =(await _firebaseAuth.
    signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage( "Error: " + errMsg.toString(),context);
    })).user;

    if(firebaseUser !=null)
        {

      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null)
        {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are now Logged in", context);
        }
        else
          {
            Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("Account does not Exist.Please Create New account.", context);
          }
      });

    }
    else
    {
      Navigator.pop(context);
      //error occurred then display message
      displayToastMessage("System Error. Cannot be signed in", context);
    }
  }

  }



