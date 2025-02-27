import 'package:application/ClientApp/authentication/ClientSignUpScreen.dart';
import 'package:application/ClientApp/splash_screen/splash_screen_client.dart';
import 'package:application/global/global.dart';
import 'package:application/welcome/welcome_screen.dart';
import 'package:application/widgets/progressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailFieldValidator
{
  static String? validate (String value)
  {
    return value.isEmpty ? 'please enter your email' : null;
  }
}
class PasswordFieldValidator
{
static String? validate(String value)
{
  return value.isEmpty? 'please enter your password' : null;
}
}
class ClientLoginScreen extends StatefulWidget
{

  @override
  _ClientLoginScreenState createState() => _ClientLoginScreenState();
}




class _ClientLoginScreenState extends State<ClientLoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  // validateForm()
  // {
  //   if(!emailTextEditingController.text.contains("@"))
  //   {
  //     Fluttertoast.showToast(msg: "Email address is not Valid.");
  //   }
  //   else if(passwordTextEditingController.text.isEmpty)
  //   {
  //     Fluttertoast.showToast(msg: "Password is required.");
  //   }
  //   else
  //   {
  //     loginDriverNow();
  //   }
  // }

  loginUserNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("users");
      driversRef.child(firebaseUser.uid).once().then((driverKey)
      {
        final snap = driverKey.snapshot;
        if(snap.value != null)
        {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Login Successful.");
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen2()));
        }
        else
        {
          Fluttertoast.showToast(msg: "No record exist with this email.");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen2()));
        }
      });
    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred during Login.");
    }
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: AppBar(

                backgroundColor: Colors.blue,
                elevation: 1,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Welcome()));
                  },
                ),


            ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child : Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/user_logo1.png"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Login as a Client",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextFormField(
                controller: emailTextEditingController,
                validator: (value) => EmailFieldValidator.validate(value!),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.black
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),

              TextFormField(
                controller: passwordTextEditingController,
                validator: (value) => PasswordFieldValidator.validate(value!),
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.black
                ),
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: ()
                {
                  if(formKey.currentState!.validate())
                    {
                      loginUserNow();
                    }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,

                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              TextButton(
                child: const Text(
                  "Do not have an Account? SignUp Here",
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> ClientSignUpScreen()));
                },
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }
}
