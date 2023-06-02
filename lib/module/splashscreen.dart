import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uptodate/other/data1.dart';
import 'package:uptodate/other/database1.dart';

import 'managetasks.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }
  navigatetohome()async{
    await Future.delayed((Duration(milliseconds: 1800,)));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>manage()),);
  }
  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Padding(
                   padding:  EdgeInsets.only(left: 18),
                   child: Image.asset("asstes/pic/Vector.png",height: 110,),
                 ),
              SizedBox(height: 25,),
              Text("UpTodo",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30,fontFamily: 'Lato',letterSpacing: 2.5,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
