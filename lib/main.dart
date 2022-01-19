
import 'package:NewsApp/Appointment/Appointment.dart';

import 'package:NewsApp/login/screens/profile_screen.dart';
import 'package:NewsApp/pages/about.dart';
import 'package:NewsApp/pages/splash.dart';

import 'package:NewsApp/styles/utisl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'styles/color_filters.dart';
import 'News/home.dart';

import 'login/screens/login_screen.dart';
import 'styles/moods.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());

}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:Splash()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    // User user;
    // DatabaseReference taskRef;
    // void initState() {
    //
    //   user = FirebaseAuth.instance.currentUser;
    //   if( user != null )
    //   {
    //     var user;
    //     taskRef = FirebaseDatabase.instance.reference().child('tasks').child(user.uid);
    //   }
    //   super.initState();
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('DIAGNO+',textAlign: TextAlign.center,),
      elevation: 0.0,

      backgroundColor: Colors.blue ,
      ),
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Stack(
      clipBehavior: Clip.none, alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
      _backBgCover(),
      _greetings(),
      _moodsHolder(),
      ],
      ),
      SizedBox(
      height: 50.0,
      ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                buildAppointmentCard(),
                SizedBox(
                  height: 20,
                ),
                // Reminder(),
                // SizedBox(
                //   height: 20,
                // ),

                buildNewsCard(),
                // buildImageCard(),
                //_specialistsCardInfo(),
              ],
            ),
          ),
        ),
        ],
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
  Widget buildNewsCard() =>   GestureDetector(
    onTap: () {
      // Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context)=> HomePage()),
      );

    },

    child:   Card(
      shadowColor: Colors.green,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [

            SizedBox(
              width: MediaQuery.of(context).size.width*0.60,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medical News',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),

                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Check the latest news in the world of medicine!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.15,


              child: Icon(Icons.keyboard_arrow_right,size: 60 ,color: Color.fromRGBO(0, 0, 0, 0.6),),

            ),
          ],
        ),
      ),

    ),
  );
  Positioned _moodsHolder() {

    return Positioned(
      bottom: -45,
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child:MoodsSelector(),
      ),
    );
  }
  Container _backBgCover() {
    return Container(
      height: 220.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      top: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'HELLO!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'How are you feeling today ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  // Widget buildSymptomsCard() =>   GestureDetector(
  //
  //   onTap: () {
  //     // Navigator.of(context).pop();
  //     Navigator.push(context, MaterialPageRoute(
  //         builder: (BuildContext context)=> Symptoms()),
  //     );
  //
  //   },
  //
  //   child:   Card(
  //
  //     shadowColor: Colors.red,
  //     elevation: 8,
  //     clipBehavior: Clip.antiAlias,
  //     shape:  RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(24),
  //     ),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width ,
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [Colors.yellow, Colors.orange],
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //         ),
  //       ),
  //
  //       padding: EdgeInsets.all(16),
  //       child: Row(
  //         crossAxisAlignment:CrossAxisAlignment.end,
  //         children: [
  //
  //           SizedBox(
  //             width: 250,
  //
  //             child: Column(
  //
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Check your Symptoms',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //
  //                   ),
  //
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Text(
  //                   'Select the symptoms you have and know what possibly you are diagnosed with',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //
  //           SizedBox(
  //             width: 81,
  //
  //
  //             child: Icon(Icons.keyboard_arrow_right,size: 60 ,color: Color.fromRGBO(0, 0, 0, 0.6),),
  //
  //           ),
  //         ],
  //       ),
  //     ),
  //
  //   ),
  // );
  Widget buildAppointmentCard() =>   GestureDetector(

    onTap: () {
      // Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context)=> Appointment()),
      );

    },

    child:   Card(

      shadowColor: Colors.red,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        padding: EdgeInsets.all(16),
        child: Row(
crossAxisAlignment:CrossAxisAlignment.end,
          children: [

            SizedBox(
              width: MediaQuery.of(context).size.width*0.60,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book an appointment',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),

                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Check the list of various doctors and fix an appointment with Them!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width*0.15,


                  child: Icon(Icons.keyboard_arrow_right,size: 60 ,color: Color.fromRGBO(0, 0, 0, 0.6),),

              ),
          ],
        ),
      ),

    ),
  );


  void sendRequest(String path) {}
}




Widget buildImageCard() =>    Card(

    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),

    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
          ),
          colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'Card With Splash',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),

);
// Widget _Rock(){
//   Container(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//     ),
//   );
// }