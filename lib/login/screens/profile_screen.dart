import 'dart:io';

import 'package:NewsApp/login/models/user_model.dart';
import 'package:NewsApp/pages/about.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';

import '../../Appointment/Appointment.dart';
import '../../News/home.dart';
import '../../main.dart';
import 'login_screen.dart';


class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user;
  UserModel userModel;
  DatabaseReference userRef;

  File imageFile;
  bool showLocalFile = false;


  _getUserDetails() async {
    DataSnapshot snapshot = (await userRef.once());

    userModel = UserModel.fromMap(Map<String, dynamic>.from(snapshot.value));

    setState(() {});
  }

  _pickImageFromGallery() async {

    XFile xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if( xFile == null ) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {

    });

    // upload to firebase storage


    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try{
      var fileName = userModel.email + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance.ref().child('profileImage').child(fileName).putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();

      print(profileImageUrl);

      progressDialog.dismiss();

    } catch( e ){
      progressDialog.dismiss();

      print(e.toString());
    }


  }

  _pickImageFromCamera() async {
    XFile xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if( xFile == null ) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userRef =
          FirebaseDatabase.instance.reference().child('users').child(user.uid);
    }

    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: userModel == null
          ? const  Center(child:  CircularProgressIndicator())
          : Padding(
        padding:  EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: MediaQuery.of(context).size.width*0.25),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: showLocalFile ?

                      FileImage(imageFile) as ImageProvider
                          :

                      userModel.profileImage == ''
                          ? const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                          : NetworkImage(userModel.profileImage)),

                  IconButton(icon: const Icon(Icons.camera_alt), onPressed: (){

                    showModalBottomSheet(context: context, builder: (context){
                      return
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: const Text('From Gallery'),
                                onTap: (){
                                  _pickImageFromGallery();
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('From Camera'),
                                onTap: (){

                                  _pickImageFromCamera();
                                  Navigator.of(context).pop();

                                },
                              ),
                            ],
                          ),
                        );
                    });

                  },),
                ],


              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),

              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: const TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 6,),
                        decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Colors.blue,width: 5), borderRadius: BorderRadius.circular(10)),

                        child: Row(
                          children: [
                            Text(
                              userModel.fullName,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email",
                      style: const TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width:double.infinity,
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 6,),
                      decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Colors.blue,width: 5), borderRadius: BorderRadius.circular(10)),

                      child: Text(
                        userModel.email,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Date of Joining",
                      style: const TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      // margin: EdgeInsets.only(right: 100),
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 6,),
                      decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Colors.blue,width: 5), borderRadius: BorderRadius.circular(10)),

                      child: Text(
                        'Joined ${getHumanReadableDate(userModel.dt)}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
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
                    builder: (BuildContext context)=> AboutPage()
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

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
