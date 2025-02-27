import 'package:application/global/global.dart';
import 'package:application/info_handler/app_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';






class RatingsTabPage extends StatefulWidget
{
  const RatingsTabPage({Key? key}) : super(key: key);

  @override
  State<RatingsTabPage> createState() => _RatingsTabPageState();
}




class _RatingsTabPageState extends State<RatingsTabPage>
{
  double ratingsNumber=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRatingsNumber();
  }

  getRatingsNumber()
  {
    setState(() {
      ratingsNumber = double.parse(Provider.of<AppInfo>(context, listen: false).driverAverageRatings);
    });

    setupRatingsTitle();
  }

  setupRatingsTitle()
  {
    if(ratingsNumber.truncate() == 0)
    {
      setState(() {
        titleStarsRatingDriver = "Not Rated";
      });
    }

    if((ratingsNumber.truncate() > 0)&&(ratingsNumber.truncate() <= 1))
    {
      setState(() {
        titleStarsRatingDriver = "Very Bad";
      });
    }
    if(ratingsNumber.truncate() == 2)
    {
      setState(() {
        titleStarsRatingDriver = "Bad";
      });
    }
    if(ratingsNumber.truncate() == 3)
    {
      setState(() {
        titleStarsRatingDriver = "Good";
      });
    }
    if(ratingsNumber.truncate() == 4)
    {
      setState(() {
        titleStarsRatingDriver = "Very Good";
      });
    }
    if(ratingsNumber.truncate() == 5)
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
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: Colors.grey,
        child: Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 22.0,),

              const Text(
                "your Ratings:",
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 22.0,),

              const Divider(height: 4.0, thickness: 4.0,),

              const SizedBox(height: 22.0,),

              SmoothStarRating(
                rating: ratingsNumber,
                allowHalfRating: false,
                starCount: 5,
                color: Colors.blue,
                borderColor: Colors.blue,
                size: 46,
              ),

              const SizedBox(height: 12.0,),

              Text(
                titleStarsRatingDriver,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 18.0,),

            ],
          ),
        ),
      ),
    );
  }
}
