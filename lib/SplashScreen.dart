import 'dart:async';

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
    // TODO: implement initState
    super.initState();
    // Timer(Duration (seconds: 3),(){
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ))
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 200,
                height: 200,
                child:Image.asset('assets/images/virus.png'),),
              builder: (BuildContext context,Widget? child){
                return Transform.rotate(
                    angle: _controller.value*0.2* math.pi,
                child: child,);
              }),

          const SizedBox(height: 20,),
          Center(child: Text("Covid 19\n Tracker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))
        ]),
    );
  }
}
