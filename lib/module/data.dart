

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uptodate/module/homescreen.dart';

import '../other/database1.dart';
import 'createroutine.dart';
import 'data.dart';

class data extends StatefulWidget {
  const data({Key? key}) : super(key: key);

  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {

  List item=[
    "1",
    "2",
    "3",
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.view_headline),
          title: Text(
            "Index",
            style: TextStyle(fontFamily: 'Lato'),
          ),
          actions: [

            CircleAvatar(
              backgroundImage: AssetImage("assets/pic/okay.png",),
              radius: 25,
              child: Image.asset("asstes/pic/okay.png",height: 100,),

            ),
          ],
        ),
        body: Container(
          color: Colors.black,
         child: ListView(
           children: [
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 20),
               child: TextField(
                 style: TextStyle(color: Colors.white,fontFamily: 'Lato'),
                 decoration: InputDecoration(

                   enabledBorder: OutlineInputBorder(

                     borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(
                 width: 2,
                 color: Color(0xFFFFFFFF),
               ),
                   ),
                   focusedBorder: OutlineInputBorder(

                     borderRadius: BorderRadius.circular(15),
                     borderSide: BorderSide(
                 width: 2,
                 color: Color(0xFFFFFFFF),
               ),
                   ),
                   prefixIcon:   Icon(Icons.search_outlined,color: Color(0xFFFFFFFF),),
                   hintText: 'Search for your task...',
                   hintStyle: TextStyle(color: Color(0xFFFFFFFF),fontFamily: 'Lato'),
                 ),
               ),
             ),
             Container(
               height: 500,

               child: ListView.builder(
                 itemCount: item.length,
                 itemBuilder: (context, index) {
                 return Container(
                   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                   height: 72,
                   color: Color(0xFF363636),
                   child: Column(
                     children: [
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: Text("}",style: TextStyle(fontFamily: 'Lato',color: Color(0xFFFFFFFF)),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 00,horizontal: 20),
                            child: Text("des",style: TextStyle(fontFamily: 'Lato',color: Color(0xFFAFAFAF)),),
                          ),
                        ],
                      ),
                     ],
                   ),
                 );
               },),
             )
           ],
         ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF8687E7),
          onPressed: (){



            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                context: context,


                builder: (BuildContext context){
                  return Container(
                    height: 350,
                    width: 100,
                    color: Color(0xFF363636),
                    child: ListView(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                          child: Text("Add Task",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18,fontFamily: 'Lato',fontWeight: FontWeight.bold,letterSpacing: 1),),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(

                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,

                                ),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     width: 2,
                              //     color: Color(0xFFFFFFFF),
                              //   ),
                              // ),
                              // labelText: 'Enter Name',
                              hintText: 'Write Your Work',
                              hintStyle: TextStyle(color: Color(0xFFFFFFFF),fontFamily: 'Lato'),

                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(

                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,

                                ),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     width: 2,
                              //     color: Color(0xFFFFFFFF),
                              //   ),
                              // ),
                              // labelText: 'Enter Name',
                              hintText: 'Description',
                              hintStyle: TextStyle(color: Color(0xFFFFFFFF),fontFamily: 'Lato'),

                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                          child: Row(
                            children: [
                              Image.asset("asstes/pic/timer.png",height: 30,),
                              SizedBox(width: 40,),
                              Image.asset("asstes/pic/tag.png",height: 30,),
                              SizedBox(width: 40,),
                              Image.asset("asstes/pic/flag.png",height: 30,),
                              SizedBox(width: 100,),
                              Image.asset("asstes/pic/send.png",height: 30,),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                          child: ElevatedButton(

                            onPressed: (){


                              // FirebaseFirestore.instance.collection('data').add({'text':'okaydone'});
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => data(),),);
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF8875FF))),
                            child: Text("SAVE"),),
                        ),

                      ],
                    ),

                  );
                });
          },child: Icon(Icons.add),),
      ),
    );
  }
}
