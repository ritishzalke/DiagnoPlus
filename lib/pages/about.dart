
import 'dart:ui';

import 'package:NewsApp/login/screens/login_screen.dart';
import 'package:NewsApp/login/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Appointment/Appointment.dart';
import '../News/home.dart';
import '../main.dart';

class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),

  backgroundColor: Colors.blueAccent,
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
    Card(
    shadowColor: Colors.pinkAccent,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
    ),
    child: Container(
    decoration: BoxDecoration(
      // color: Color.fromRGBO(232, 190, 172, 1),
    gradient: LinearGradient(
    colors: [Color.fromRGBO(232, 170, 172, 0.3),Color.fromRGBO(242, 170, 172, 1),],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    ),
    ),

    padding: EdgeInsets.all(16),
    child: Row(
    crossAxisAlignment:CrossAxisAlignment.end,
    children: [

    SizedBox(
    width: 350,

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'About DIAGNO+',
    style: TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,

    ),

    ),
    const SizedBox(height: 15),
    Text(
    "A user login is provided. \nUser can fix an appointment with a doctor by clicking on the given time slot. \nThe receipt will be generated when the appointment is booked \nUsers can also see daily news with the help of the news option.",
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    ),
    ),
    ],
    ),
    ),

    ],
        )
    )
        ),
            SizedBox(height: 15),

            Card(
                shadowColor: Colors.pinkAccent,
                elevation: 8,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.greenAccent,Colors.limeAccent,Colors.amberAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),

                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.end,
                      children: [

                        SizedBox(
                          width: 350,

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Us',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),
                              const SizedBox(height: 15),
                              Text(
                                "Diagno+ app is a collaborative project made by second year students for VJTI Inheritance Program 2021.\nTeam Members are:\n1. Soham Chaudhari (CS)\n2. Ritish Zalke (CS)\n3. Nirbhay Nikam (CS)\n4. Chaitanya Deshpande (Mech)"

                                , style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    )
                )
            ),
    ]
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // new UserAccountsDrawerHeader(
            //   accountName: Text('Ritish'),
            //   accountEmail: Text('ricjjcd@gmail.com'),
            //   currentAccountPicture: const CircleAvatar(
            //     backgroundImage: NetworkImage('https://images.squarespace-cdn.com/content/v1/5824673c2e69cfc8ac1e3cd3/1580377764933-1L0AVRF4MU86B18J3S4A/Picture+of+woodlands+taken+on+iphone+using+natural+light'),
            //   ) ,
            // ),

            ListTile(
              title: Text("Home"),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=> MyHomePage(),
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("My Profile"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> ProfileScreen()
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("Appointments"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=> Appointment(),
                ),

                );
              },
            ),
            // new Divider(),
            // ListTile(
            //   title: Text("Medicine reminder"),
            //   onTap: (){
            //     Navigator.of(context).pop();
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (BuildContext context)=> Reminder(),
            //     ),
            //
            //     );
            //   },
            // ),
            new Divider(),
            ListTile(
              title: Text("News"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> HomePage()
                ),

                );
              },
            ),


            new Divider(),
            ListTile(
              title: Text("About Page"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context)=> new AboutPage()
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("Log Out"),
              onTap: (){
                // Navigator.of(context).pop();
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(
                    title: Text('Confirmation !!!'),
                    content: Text('Are you sure to Log Out ? '),
                    actions: [

                      TextButton(onPressed: (){

                        Navigator.of(ctx).pop();

                      }, child: Text('No'),),


                      TextButton(onPressed: (){
                        Navigator.of(ctx).pop();

                        FirebaseAuth.instance.signOut();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return  LoginScreen();
                        }));

                      }, child: Text('Yes'),),

                    ],
                  );
                }
                );
              },
            ),
          ],
        ),


      ),
    );
  }
}
