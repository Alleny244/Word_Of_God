import 'package:flutter/material.dart';
import 'package:wordofgod/diplay1.dart';
import './loader1.dart';
import './notFound.dart';

import './optionScreen.dart';
import './spinner.dart';
import './verseR.dart';
import './textInput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const MaterialColor kPrimaryColor = const MaterialColor(
      0xFFB22222,
      const <int, Color>{
        50: const Color(0xFFB22222),
        100: const Color(0xFFB22222),
        200: const Color(0xFFB22222),
        300: const Color(0xFFB22222),
        400: const Color(0xFFB22222),
        500: const Color(0xFFB22222),
        600: const Color(0xFFB22222),
        700: const Color(0xFFB22222),
        800: const Color(0xFFB22222),
        900: const Color(0xFFB22222),
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Of God',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: kPrimaryColor,
      ),
      home: Screen1(),
      routes: {
        '/screen2': (context) => Screen2(),
        '/spinner': (context) => Spinner(),
        '/verse': (context) => RandomVerse(),
        '/input': (context) => InputField(),
        '/notfound': (context) => NotFound(),
        '/display1': (context) => Display1(),
        '/loader': (context) => Loader(),
      },
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushNamed(context, '/screen2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Image.asset(
          "images/homeScreen.jpg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
