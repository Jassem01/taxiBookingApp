import 'package:application/ClientApp/splash_screen/splash_screen_client.dart';
import 'package:application/info_handler/app_info.dart';

import 'package:application/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as pro;



import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';





void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //runApp(ProviderScope(child: MyApp()));
  runApp(
    pro.ProviderScope(child :
    MyApp(
      child: ChangeNotifierProvider(
        create: (context) => AppInfo(),
        child: MaterialApp(
          home: Welcome(),
          debugShowCheckedModeBanner: false,
        ),
      ),

    )));
}

class MyApp extends StatefulWidget
{
  final Widget? child;

  MyApp({this.child});

  static void restartApp(BuildContext context)
  {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}


