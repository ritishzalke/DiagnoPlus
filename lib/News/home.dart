import 'package:NewsApp/News/services/api_service.dart';
import 'package:NewsApp/pages/about.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Appointment/Appointment.dart';

import '../login/screens/login_screen.dart';
import '../login/screens/profile_screen.dart';
import '../main.dart';
import 'article_model.dart';
import 'components/customListTile.dart';

// void main() {
//   runApp(MyApp());
// }

// class home extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical News",
            style: TextStyle(color: Colors.white),
        ),
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
        backgroundColor: Colors.blueAccent,
      ),

      //Now let's call the APi services with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
