
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Text('Sign Up Please'),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData( color: Colors. black,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height*0.05),
            Container(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,

              child:Text("SIGN UP HERE",textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),

              ),

            ),
            SizedBox(height: height*0.03),
            TextField(
              controller: fullNameController,

              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'FullName',
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
            SizedBox(height: height*0.03),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Confirm Password',
              ),
            ),
            SizedBox(height: height*0.03),
            ElevatedButton(
                style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 50,right: 50,top: 20,
                    bottom: 20)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
                onPressed: () async {
                  var fullName = fullNameController.text.trim();
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  var confirmPass = confirmController.text.trim();

                  if (fullName.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmPass.isEmpty) {
                    // show error toast

                    Fluttertoast.showToast(msg: 'Please fill all fields');
                    return;
                  }

                  if (password.length < 6) {
                    // show error toast
                    Fluttertoast.showToast(
                        msg:
                        'Weak Password, at least 6 characters are required');

                    return;
                  }

                  if (password != confirmPass) {
                    // show error toast
                    Fluttertoast.showToast(msg: 'Passwords do not match');

                    return;
                  }

                  // request to firebase auth
                  //
                  ProgressDialog progressDialog = ProgressDialog(
                    context,
                    title: const  Text('Signing Up'),
                    message: const Text('Please wait'),
                  );

                  progressDialog.show();
                  try {


                    FirebaseAuth auth = FirebaseAuth.instance;

                    UserCredential userCredential =
                    await auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (userCredential.user != null) {

                      // store user information in Realtime database

                      DatabaseReference userRef = FirebaseDatabase.instance.reference().child( 'users');

                      String uid = userCredential.user.uid;
                      int dt = DateTime.now().millisecondsSinceEpoch;

                      await userRef.child(uid).set({
                        'fullName': fullName,
                        'email': email,
                        'uid': uid,
                        'dt': dt,
                        'profileImage': ''

                      });


                      Fluttertoast.showToast(msg: 'Success');

                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showToast(msg: 'Failed');
                    }

                    progressDialog.dismiss();
                    // progressDialog.dismiss();

                  } on FirebaseAuthException catch (e) {
                    progressDialog.dismiss();
                    if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg: 'Email is already in Use');
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: 'Password is weak');
                    }
                  } catch (e) {
                    // progressDialog.dismiss();
                    Fluttertoast.showToast(msg: 'Something went wrong');
                  }
                },
                child: const Text('Sign Up')),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
