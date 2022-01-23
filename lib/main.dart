import 'dart:async';

import 'package:aftp/providers/state_provider.dart';
import 'package:aftp/screens/confirm_number.dart';
import 'package:aftp/shader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarBrightness: Brightness.dark, // status bar color
    statusBarColor: Colors.transparent
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> StateProvider(),)
      ],
      child: MaterialApp(
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
              data: data.copyWith(
              textScaleFactor: 1,),
          child: child!
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'AFTP',
        home: SplashScreen(),
themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff181A20),
          brightness: Brightness.dark,
          textTheme: GoogleFonts.interTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            fontSizeFactor: 1.0,
          ).copyWith(subtitle1: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),

        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => ConfirmNumber()), (route) => route.isCurrent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RotatedBox(
              quarterTurns: 2,
              child: Container(
                height: 416,
                width: 416,
                transform: Matrix4.translationValues(80, 80.0, 0.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/images/gradient.png'))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 416,
              width: 416,
              transform: Matrix4.translationValues(80, 80.0, 0.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/gradient.png'))),
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(decoration: BoxDecoration(color: Color(0xff181A20).withOpacity(0.7))),
          ),
          Center(
            child: Image(
              height: 186,
              image: AssetImage('assets/images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  final bool showPolygon;

  const Background({Key? key, this.child: const SizedBox(), this.showPolygon: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: RotatedBox(
            quarterTurns: 2,
            child: Container(
              height: 416,
              width: 416,
              transform: Matrix4.translationValues(80, 80.0, 0.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/images/gradient.png'))),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 416,
            width: 416,
            transform: Matrix4.translationValues(80, 80.0, 0.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/gradient.png'))),
          ),
        ),
       if(showPolygon) Align(
          alignment: Alignment.centerRight,
          heightFactor: 4.5,
          child: Image(
            image: AssetImage('assets/images/polygon.png'),
            height: 93,
          ),
        ),
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(decoration: BoxDecoration(color: Color(0xff181A20).withOpacity(0.8))),
        ),
        child
      ],
    );
  }
}
