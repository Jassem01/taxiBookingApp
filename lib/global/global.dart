import 'dart:async';
import 'dart:ui';
import 'package:application/model/direction_details_info.dart';
import 'package:application/model/directions.dart';
import 'package:application/model/driver_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:application/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:assets_audio_player/assets_audio_player.dart';



final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
StreamSubscription<Position>? streamSubscriptionPosition;
StreamSubscription<Position>? streamSubscriptionDriverLivePosition;
List dList = []; //online-active drivers Information List
 //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
String? chosenDriverId="";
Position? driverCurrentPosition;
DriverData onlineDriverData = DriverData();
String? driverVehicleType = "";
String cloudMessagingServerToken = "key=AAAA6H9qGts:APA91bFF_jYaysM2aARKOVgei-W2LTNnfznSG-BYL5Gf14LUXiEHIHcFbKVCD4U4X95xirpObk0cuplodvUS8DOzBmjWXFYcYot1FeF5vOhP-RWneiLT-_ThKt4SAcNY_0OohDSdnbPd";
String userDropOffAddress = "";
String driverCarDetails="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";
Directions? userDropOffLocation;
void updateDropOffLocationAddress(Directions dropOffAddress)
{
  userDropOffLocation = dropOffAddress;

}
String titleStarsRatingDriver = "Not Rated";
String statusText = "Now Offline";
Color buttonColor = Colors.grey;
bool isDriverActive = false;

