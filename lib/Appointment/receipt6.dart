
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../login/models/user_model.dart';
class Receipt6 extends StatefulWidget {
  // const Receipt({Key? key}) : super(key: key);

  @override
  _Receipt6State createState() => _Receipt6State();
}

class _Receipt6State extends State<Receipt6> {
  User user;
  UserModel userModel;
  DatabaseReference userRef;
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(key: _printKey);

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }
  _getUserDetails() async {
    DataSnapshot snapshot = (await userRef.once());

    userModel = UserModel.fromMap(Map<String, dynamic>.from(snapshot.value));

    setState(() {});
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
        title: const Text('Receipt'),
        backgroundColor: Colors.blueAccent,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RepaintBoundary(
              key: _printKey,
              child:userModel == null
          ? const  Center(child:  CircularProgressIndicator())
          :Column(
        children: [

          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              child: Text(
                "APPOINTMENT CONFIRMED",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Divider(
            thickness: 20,
          ),
          SizedBox(height: 30,),
          Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,bottom: 15),
                  child: Text("Doctor's Name: Doctor 1", style: TextStyle(fontSize: 15),),
                ),
              ]
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,bottom: 15),
                child: Text("Patient's name: ",style: TextStyle(fontSize: 15),),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  margin: EdgeInsets.only(left: 10,bottom: 15),
                  child: Text(
                    userModel.fullName,
                  ),
                ),
              ),

            ],
          ),
          Row(
            children: [
              Container( margin: EdgeInsets.only(left: 10,bottom: 15),
                child: Text("Patient's Email ID: ",style: TextStyle(fontSize: 15),),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container( margin: EdgeInsets.only(left: 10,bottom: 15),
                  child: Text(
                    userModel.email,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,bottom: 15),
                child: Text("Date of appointment: ",style: TextStyle(fontSize: 15),),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,bottom: 15),
                child: Text(
                  DateFormat.yMMMd().format(DateTime.now()),style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,bottom: 15),
                child: Text("Time: 6:30",style: TextStyle(fontSize: 15),),
              ),
            ],
          ),
          Divider(
            thickness: 20,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/stamp.png")
          //     )
          //   ),
          // )
          SizedBox(height: 30,),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [Image.asset(

                  "assets/stmp.png"
              ),
              ]
          ),
          SizedBox(height: 30,),
          Divider(
            thickness: 20,
          ),
        ],


      ),
    ),
    ],
    ),
    ),
    floatingActionButton: FloatingActionButton(
    child: const Icon(Icons.print),
    onPressed: _printScreen,
    ),
    );
  }
}

