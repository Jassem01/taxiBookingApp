import 'package:application/global/global.dart';
import 'package:application/info_handler/app_info.dart';
import 'package:application/splashScreen/splash_screen.dart';
import 'package:application/widgets/info_design_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';




class ProfileTabPage extends StatefulWidget
{
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage>
{

  double ratingsNumberForProfile=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRatingsNumberForProfile();
  }

  getRatingsNumberForProfile()
  {
    setState(() {
      ratingsNumberForProfile = double.parse(Provider.of<AppInfo>(context, listen: false).driverAverageRatings);
    });

    setupRatingsTitleForProfile();
  }

  setupRatingsTitleForProfile()
  {
    if(ratingsNumberForProfile.truncate() == 0)
    {
      setState(() {
        titleStarsRatingDriver = "Not Rated";
      });
    }

    if((ratingsNumberForProfile.truncate() > 0)&&(ratingsNumberForProfile.truncate() <= 1))
    {
      setState(() {
        titleStarsRatingDriver = "Very Bad";
      });
    }
    if(ratingsNumberForProfile.truncate() == 2)
    {
      setState(() {
        titleStarsRatingDriver = "Bad";
      });
    }
    if(ratingsNumberForProfile.truncate() == 3)
    {
      setState(() {
        titleStarsRatingDriver = "Good";
      });
    }
    if(ratingsNumberForProfile.truncate() == 4)
    {
      setState(() {
        titleStarsRatingDriver = "Very Good";
      });
    }
    if(ratingsNumberForProfile.truncate() == 5)
    {
      setState(() {
        titleStarsRatingDriver = "Excellent";
      });
    }
  }



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //name
            Text(
              onlineDriverData.name!,
              style: const TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),


            Text(
              titleStarsRatingDriver + " driver",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.black,
                height: 2,
                thickness: 2,
              ),
            ),

            const SizedBox(height: 38.0,),

            //phone
            InfoDesignUIWidget(
              textInfo: onlineDriverData.phone!,
              iconData: Icons.phone_iphone,
            ),

            //email
            InfoDesignUIWidget(
              textInfo: onlineDriverData.email!,
              iconData: Icons.email,
            ),

            InfoDesignUIWidget(
              textInfo: onlineDriverData.car_color! + " " + onlineDriverData.car_model! + " " +  onlineDriverData.car_number!,
              iconData: Icons.car_repair,
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: ()
              {
                fAuth.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            )

          ],
        ),
      ),
    );
  }
}
