import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomRectClipper(),
            child: Container(
              decoration: BoxDecoration(
                color:Color.fromRGBO(88,103,124, 1),
                ),
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.cover)
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                ),
            child: Center(child: Text("Control your home easier", style: TextStyle(wordSpacing: 2),),),
          )
        ],
      ),
    );
  }
}

class CustomRectClipper extends CustomClipper<Path>{
@override
 Path getClip(Size size) {
   Path path = new Path();
    path.lineTo(0,size.height - 40);
    path.quadraticBezierTo(size.width/2, size.height+40, size.width ,size.height-40);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
 }
 @override
 bool shouldReclip(CustomClipper<Path> oldClipper) {

 return false;
 }
}