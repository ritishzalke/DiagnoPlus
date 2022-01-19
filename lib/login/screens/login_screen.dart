import 'package:NewsApp/login/screens/signup_screen.dart';

import 'package:NewsApp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('Login Please'),
      // ),
      body:

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height*0.15),
            Text("DIAGNO+",style: TextStyle(color: Colors.blue,fontSize: 45,fontWeight: FontWeight.bold) ,

            ),

            SizedBox(height: height*0.1),
            Container(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,

              child:Text("LOGIN HERE",textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),

              ),

            ),
            SizedBox(height: height*0.03),
             TextField(
               controller: emailController,
              decoration: const InputDecoration(

                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Email',
              ),
            ),
             SizedBox(height: height*0.03),
            TextField(
              controller: passwordController,
              obscureText: true,

              decoration: const InputDecoration(

                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Password',
              ),
            ),

           SizedBox(height: height*0.03,),

            ElevatedButton(
                style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 50,right: 50,top: 20,
                bottom: 20)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
                onPressed: () async {

              var email = emailController.text.trim();
              var password = passwordController.text.trim();
              if( email.isEmpty || password.isEmpty ){
                // show error toast
                Fluttertoast.showToast(msg: 'Please fill all fields');
                return;
              }

              // request to firebase auth

              ProgressDialog progressDialog = ProgressDialog(
                context,
                title: const  Text('Logging In'),
                message: const Text('Please wait'),
              );

              progressDialog.show();

              try{

                FirebaseAuth auth = FirebaseAuth.instance;

                UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

                if( userCredential.user != null ){


                   progressDialog.dismiss();
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                     return MyHomePage();
                   }));
                }



              }
              on FirebaseAuthException catch ( e ) {

                progressDialog.dismiss();

                if( e.code == 'user-not-found'){
                  Fluttertoast.showToast(msg: 'User not found');

                }else if( e.code == 'wrong-password'){
                  Fluttertoast.showToast(msg: 'Wrong password');

                }

              }
              catch(e){
                Fluttertoast.showToast(msg: 'Something went wrong');
                progressDialog.dismiss();
              }


            }, child:const  Text('Login')),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not Registered Yet?'),
                TextButton(onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return SignUpScreen();
                  }));
                }, child: Text('Register Now!')),
              ],
            )
          ],
        ),
      ),
    );
  }
}