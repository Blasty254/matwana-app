import 'package:flutter/cupertino.dart';
import 'package:matwana_app/Models/address.dart';

class AppData extends ChangeNotifier
{
  Address pickUpLocation , dropOffLocation;
  void updatePickUpLocationAddress(Address pickUpAddress)
  {
    pickUpLocation = pickUpAddress;
    notifyListeners(); //any changes that occurs to the pick up it will notify
  }

  void updateDropOffLocationAddress(Address dropOffAddress)
  {
    dropOffLocation = dropOffAddress;
    notifyListeners(); //any changes that occurs to dropOff it will notify
  }

}