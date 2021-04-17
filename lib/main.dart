import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Matwanaapp(),
  ));
}
 class Matwanaapp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("MatwanaApp"),
         centerTitle: true,
       ),
       drawer: Drawer(

         child:ListView(
           padding: EdgeInsets.zero,
           
           children: <Widget >[
             DrawerHeader(child: Text('Profile'),

                 decoration :BoxDecoration(
                    color: Colors.redAccent ,

                 )
                 

             ),

                 InkWell(
                   child: ListTile(
                    title : Text ('Ratings'),
                     onTap: (){
                   }
                   ),
                 ),
             ListTile(
                 title : Text ('Wallet'),
                 onTap: (){
                 }
             ),

             ListTile(
                 title : Text ('Promotions'),
                 onTap: (){
                 }
             ),
             ListTile(
                 onTap: (){
                   Navigator.pop(context);

                 },
                 title : Text ('Settings')
             ),



           ],
         ),
       ),


     );
     
   }
 }

 