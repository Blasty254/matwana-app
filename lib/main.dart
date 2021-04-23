import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matwana_app/All%20Screens/LoginScreen.dart';
import 'package:matwana_app/All%20Screens/RegistrationForms.dart';
import 'package:matwana_app/All%20Screens/mainscreen.dart';

void main()
{
  runApp(MyApp(
  ));
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Matwana App',
       theme: ThemeData(
         fontFamily: "Signatra",
         primarySwatch: Colors.lightBlue,
         visualDensity: VisualDensity.adaptivePlatformDensity, 


       ),
       home: RegistrationScreen(),
       debugShowCheckedModeBanner: false,
     );
   }
 }

 