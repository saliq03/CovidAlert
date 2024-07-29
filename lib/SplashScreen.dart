import 'dart:async';

import 'package:covidalert/Home.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
 late final AnimationController _controller=AnimationController(
     duration: const Duration(seconds: 3),
       vsync: this,)..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    Timer(const Duration (seconds: 3),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2b3618),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 300,
                height: 300,
                child:Image.asset('assets/images/virus.png'),),
              builder: (BuildContext context,Widget? child){
                return Transform.rotate(
                    angle: _controller.value*0.2* math.pi,
                child: child,);
              }),
          const Center(child: Text("Covid-19\n Tracker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),))
        ]),
    );
  }
}
