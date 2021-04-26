
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:matwana_app/All%20Screens/LoginScreen.dart';
import 'package:matwana_app/All%20Screens/RegistrationForms.dart';
import 'package:matwana_app/All%20Screens/mainscreen.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
  ));
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Matwana App',
       theme: ThemeData(

         primarySwatch: Colors.lightBlue,
         visualDensity: VisualDensity.adaptivePlatformDensity, 


       ),
       initialRoute: MainScreen.idScreen,
       routes: {
         RegistrationScreen.idScreen: (context) => RegistrationScreen(),
         LoginScreen.idScreen: (context) => LoginScreen(),
         MainScreen.idScreen: (context) => MainScreen(),

       },
       debugShowCheckedModeBanner: false,
     );
   }
 }

 