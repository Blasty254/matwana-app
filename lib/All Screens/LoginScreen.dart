import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matwana_app/All%20Screens/RegistrationForms.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "Login";
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
                          style: TextStyle(fontSize: 14.0),

                        ),

                        TextField(
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
                          style: TextStyle(fontSize: 14.0),

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
                            print("The log in is clicked");
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
}


