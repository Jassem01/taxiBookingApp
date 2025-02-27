import 'dart:async';

import 'package:application/authentication/DriverLoginScreen.dart';
import 'package:application/authentication/home_page.dart';
import 'package:application/mainScreens/main_screen.dart';
import 'package:application/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/global/global.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> DriverLoginScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(

    child : Container(
      color : Colors.white,
      child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset("images/driver_logo1.png"),





          ],
        ),
         ),
        ),


    );
  }
}
