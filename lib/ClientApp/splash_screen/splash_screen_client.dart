import 'dart:async';

import 'package:application/ClientApp/authentication/ClientLoginScreen.dart';
import 'package:application/ClientApp/authentication/client_home_page.dart';
import 'package:application/assistants/assistant_methods.dart';
import 'package:application/global/global.dart';

import 'package:flutter/material.dart';


class MySplashScreen2 extends StatefulWidget {
  const MySplashScreen2({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen2> {
  startTimer()
  {
    fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;
    Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ClientMainPage()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ClientLoginScreen()));
      }
    });
  }

  @override
  void initState() {

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
                Image.asset("images/user_logo1.png"),





              ],
            ),
          ),

        ));
  }
}
