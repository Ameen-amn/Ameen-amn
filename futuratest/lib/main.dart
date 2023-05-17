import 'package:flutter/material.dart';
import 'package:futuratest/provider/apicall.dart';
import 'package:futuratest/screen/fullScreen.dart';
import 'package:futuratest/screen/splashScreen.dart';
import './screen/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ApiCall())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Machine Text',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          "/": (_) => SplashScreen(),
          FullScreen.routeName: (_) => const FullScreen(),
          MainScreen.routeName: (_) => MainScreen(),
        },
      ),
    );
  }
}
