import 'dart:ui';
import 'package:NewsApp/Appointment/receipt.dart';
import 'package:NewsApp/Appointment/receipt1.dart';
import 'package:NewsApp/Appointment/receipt2.dart';
import 'package:NewsApp/Appointment/receipt5.dart';
import 'package:NewsApp/Appointment/receipt7.dart';
import 'package:NewsApp/login/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class DoctorDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorDetailState();

}

class _DoctorDetailState extends State<DoctorDetailPage> {
  DateTime datetime;

  UserModel userModel;



  // Future <void>selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != datetime)
  //     setState(() {
  //       datetime = picked;
  //
  //     });
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        // actions: [
        //   GestureDetector(
        //     child: Container(
        //       margin: EdgeInsets.only(right: 15),
        //       child: Icon(
        //         Icons.notifications_rounded,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              child: Container(
                margin: EdgeInsets.only(left: 30, bottom: 30),
                child: Row(
                  children: [
                    /*Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        "assets/dr_details.png",
                      ),
                    ),*/
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text('Dr. Doctor 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text('About Doctor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text('Rating: 4.5',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            /*Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text('November 2021',
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoDates("Mon", "22", false),
                  demoDates("Tue", "23", false),
                  demoDates("Wed", "24", false),
                  demoDates("Thur", "25", false),
                  demoDates("Fri", "26", false),
                  demoDates("Sat", "27", false),
                  demoDates("Sun", "28", false),
                  demoDates("Mon", "29", false),
                ],
              ),
            ),*/
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Text(datetime==null?"No date Chosen!":"Date chosen:${DateFormat.yMd().format(datetime)}",
                  //   style: TextStyle(fontSize: 20),),
                  // SizedBox(height: 20.0,),
                  // ElevatedButton(
                  //   onPressed: () async{
                  //         await date.add({
                  //           'datetime':DateTime.now()
                  //         }).then((value)=>print("user added"));
                  //   },
                  //   child: Text('Select date'),
                  // ),
                  // Text(datetime==null?"No date Chosen!":"Date chosen:${DateFormat.yMd().format(datetime)}",style: TextStyle(fontSize: 20),),
                  // ElevatedButton(onPressed: (){
                  //   showDatePicker(
                  //       context: context,
                  //       initialDate: DateTime.now(),
                  //       firstDate: DateTime(2001),
                  //       lastDate: DateTime(2222)).then((date) {
                  //     setState(() {
                  //       datetime=date;
                  //
                  //     });
                  //   });
                  // }, child: Text("Pick a date!"))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text('Available Slots\n\nMorning\n',
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left:20,right: 150),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.7,
                children: [

                  TextButton(
                      onPressed:()=>{
                    // Navigator.of(context).pop();

                    showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        title: Text('Confirmation !!!'),
                        content: Text('Are you sure to confirm the appointment ? '),
                        actions: [

                          TextButton(onPressed: (){

                            Navigator.of(ctx).pop();

                          }, child: Text('No'),),


                          TextButton(onPressed: (){




                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return  Receipt1();
                            }));

                          }, child: Text('Yes'),),

                        ],
                      );
                    }
                    ),
                  }, child: Text("7:30")),
                  SizedBox(
                    width: 9,
                  ),
                  TextButton(onPressed:()=>{
                      // Navigator.of(context).pop();
                      showDialog(context: context, builder: (ctx){
                        return AlertDialog(
                          title: Text('Confirmation !!!'),
                          content: Text('Are you sure to confirm the appointment ? '),
                          actions: [

                            TextButton(onPressed: (){

                              Navigator.of(ctx).pop();

                            }, child: Text('No'),),


                            TextButton(onPressed: (){




                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                return  Receipt();
                              }));

                            }, child: Text('Yes'),),

                          ],
                        );
                      }
                  ),
    }, child: Text("8:30")
                  )


                  // doctorTimingsData("8:30", false),
                  // doctorTimingsData("9:00 AM", false),
                  //doctorTimingsData("9:30 AM", false),
                  //doctorTimingsData("10:00 AM", false),
                  //doctorTimingsData("10:30 AM", false),
                  // doctorTimingsData("11:00 AM", false),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text('\nEvening\n',
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left:20,right: 150),

              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.6,
                children: [
                  TextButton(onPressed:()=>{
                    // Navigator.of(context).pop();
                    showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        title: Text('Confirmation !!!'),
                        content: Text('Are you sure to confirm the appointment ? '),
                        actions: [

                          TextButton(onPressed: (){

                            Navigator.of(ctx).pop();

                          }, child: Text('No'),),


                          TextButton(onPressed: (){




                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return  Receipt1();
                            }));

                          }, child: Text('Yes'),),

                        ],
                      );
                    }
                    ),
                  }, child: Text("7:30")),
                  SizedBox(
                    width: 9,
                  ),
                  TextButton(onPressed:()=>{
                    // Navigator.of(context).pop();
                    showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        title: Text('Confirmation !!!'),
                        content: Text('Are you sure to confirm the appointment ? '),
                        actions: [

                          TextButton(onPressed: (){

                            Navigator.of(ctx).pop();

                          }, child: Text('No'),),


                          TextButton(onPressed: (){




                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return  Receipt();
                            }));

                          }, child: Text('Yes'),),

                        ],
                      );
                    }
                    ),
                  }, child: Text("8:30"))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 54,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff107163),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x17000000),
                    offset: Offset(0, 15),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                'Contact Info:25431865',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDates(String day, String date, bool isSelected) {
    return isSelected ? Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    ) : Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget doctorTimingsData(String time, bool isSelected) {
    return isSelected ? Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text('8:30',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    ) : Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.black,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text('8.30',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }


}