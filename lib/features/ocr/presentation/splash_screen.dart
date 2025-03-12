import 'package:flutter/material.dart';
import 'package:scanme/features/ocr/presentation/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

   void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 150,height: 150, child: Image.asset("lib/assets/logo.png")),
            Text("Scan Me",
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}