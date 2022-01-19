import 'package:flutter/material.dart';

import 'login_screen.dart';


class LandingScreen extends StatefulWidget {
  // const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(size: 200,),
            ElevatedButton(onPressed: (){

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                return LoginScreen();
              }));

            }, child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}
