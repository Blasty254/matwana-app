import 'package:flutter/cupertino.dart';
import 'package:matwana_app/Models/address.dart';

class AppData extends ChangeNotifier
{
  Address pickUpLocation;
  void updatePickUpLocationAddress(Address pickUpAddress)
  {
    pickUpLocation = pickUpAddress;
    notifyListeners(); //any changes that occurs to the pick up it will notify
  }
}