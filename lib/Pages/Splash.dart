import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome(){
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://w0.peakpx.com/wallpaper/207/570/HD-wallpaper-sky-background-beautiful-coconut-tree-colourful-nature-pink-sunset.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),
                radius: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
