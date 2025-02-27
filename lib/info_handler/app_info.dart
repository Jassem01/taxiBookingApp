import 'package:application/model/trips_history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:application/model/directions.dart';

class AppInfo extends  ChangeNotifier
{
  Directions? userPickUpLocation;
  int countTotalTrips = 0;
  String driverAverageRatings = "0";


  List<String> historyTripsKeysList = [];

  List<TripsHistoryModel> allTripsHistoryInformationList = [];


  void updatePickUpLocationAddress(Directions userPickUpAddress)
  {
    userPickUpLocation = userPickUpAddress;
    notifyListeners();
  }



  updateOverAllTripsCounter(int overAllTripsCounter)
  {
    countTotalTrips = overAllTripsCounter;
    notifyListeners();
  }

  updateOverAllTripsKeys(List<String> tripsKeysList)
  {
    historyTripsKeysList = tripsKeysList;
    notifyListeners();
  }

  updateOverAllTripsHistoryInformation(TripsHistoryModel eachTripHistory)
  {
    allTripsHistoryInformationList.add(eachTripHistory);
    notifyListeners();
  }
  updateDriverAverageRatings(String driverRatings)
  {
     driverAverageRatings = driverRatings;
  }


}
