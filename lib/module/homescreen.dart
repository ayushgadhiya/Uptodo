import 'package:flutter/material.dart';
import 'package:uptodate/other/copy.dart';
import '../other/database1.dart';



class homepage extends StatefulWidget {

  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  // Stream<DocumentSnapshot> snapshot =  FirebaseFirestore.instance.collection("listofprods").document('ac1').snapshots();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController utitle = TextEditingController();
  final TextEditingController udescription = TextEditingController();
  List l2 = [];

  // @override
  // void initState() {
  //   firebase.readData();
  //   super.initState();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    // title.dispose();
    // description.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Builder(builder: (context) => IconButton(
            icon: new Icon(Icons.menu_outlined),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),),
          title: Text(
            "Index",
            style: TextStyle(fontFamily: 'Lato'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                // backgroundImage: AssetImage("assets/pic/okay.png",),
                // radius: 20,
                child: Image.asset(
                  "asstes/pic/okay.png",
                  height: 100,
                ),
              ),
            ),
          ],
        ),
        body:StreamBuilder<List<ToDoMedel>>(
          stream: firebase.readData(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      // description.text = snapshot.data![index].description.toString();
                      // title.text = snapshot.data![index].title.toString();
                      showAlertDialog(BuildContext context) {
                        // Create button
                        utitle.text = snapshot.data![index].title!;
                        udescription.text = snapshot.data![index].description!;
                        Widget okButton = Container(
                          height: 30,
                          child: ElevatedButton(

                            style: ButtonStyle(

                                backgroundColor:
                                MaterialStateProperty.all(Color(0xFF8875FF))),
                            child: Text("UPDATE"),
                            onPressed: () {

                              // firebase().updateData(utitle: utitle.text,udescription: udescription.text,docId:snapshot.data![index].docId );
                              // print('--------docId----->${snapshot.data![index].docId}');
                              firebase().updateData(
                                  utitle: utitle.text,
                                  udescription: udescription.text,
                                  docId: snapshot.data![index].docId
                              );
                              Navigator.pop(context);
                            },
                          ),
                        );
                        Widget notokButton = Container(
                          height: 30,
                          child: ElevatedButton(

                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Color(0xFF8875FF))),
                            child: Text("DELETE"),
                            onPressed: () {
                              // firebase().updateData(utitle: utitle.text,udescription: udescription.text,docId:snapshot.data![index].docId );
                              firebase().deleteData(
                                  docId: snapshot.data![index].docId);
                              // firebase().updateData(
                              //     utitle: utitle.text,
                              //     udescription: udescription.text,
                              //     docId: snapshot.data![index].docId
                              //
                              // );
                              Navigator.pop(context);
                            },
                          ),
                        );

                        // Create AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                value = snapshot.data![index].title!;
                              },
                              controller: utitle,
                              style: TextStyle(color: Colors.black,),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
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
                                hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF), fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                          content: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              controller: udescription,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.black,
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
                                hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF), fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                          actions: [
                            okButton,
                            notokButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      }

                      return GestureDetector(
                        // onTap: (){
                        //   showAlertDialog(context);
                        // },
                        onLongPress: (){
                          showAlertDialog(context);
                        },
                        child: Container(
                          height: 80,
                          // width: 10,
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(color: Color(0xFF363636),borderRadius: BorderRadius.circular(20)),

                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${snapshot.data![index].title}',
                                          style: TextStyle(
                                            color: Colors.white,


                                        ),
                                        ),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     showAlertDialog(context);
                                        //
                                        //
                                        //     // firebase().updateData(utitle: title.text,udescription: description.text,docId:snapshot.data![index].docId );
                                        //     // firebase().updateData(
                                        //     //     utitle: snapshot.data![index].title,
                                        //     //     udescription: snapshot.data![index]
                                        //     //         .description,
                                        //     //     docId: snapshot.data![index].docId);
                                        //
                                        //     // snapshot.data![index].title;
                                        //     // snapshot.data![index].description;
                                        //     // firebase().updateData(title: snapshot.data![index].title);
                                        //
                                        //   },
                                        //   icon: Icon(Icons.add),
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(
                                      width: 50,
                                      child: Text(
                                        '${snapshot.data![index].description}',
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,

                                        ),


                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                        Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${snapshot.data![index].title}',
                              ),
                              // IconButton(
                              //   onPressed: () {
                              //
                              //       firebase().deleteData(
                              //           docId: snapshot.data![index].docId);
                              //
                              //   },
                              //   icon: Icon(Icons.remove),
                              // ),
                              IconButton(
                                onPressed: () {
                                  showAlertDialog(context);


                                  // firebase().updateData(utitle: title.text,udescription: description.text,docId:snapshot.data![index].docId );
                                  // firebase().updateData(
                                  //     utitle: snapshot.data![index].title,
                                  //     udescription: snapshot.data![index]
                                  //         .description,
                                  //     docId: snapshot.data![index].docId);

                                  // snapshot.data![index].title;
                                  // snapshot.data![index].description;
                                  // firebase().updateData(title: snapshot.data![index].title);

                                },
                                icon: Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text('fgfg'),
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),

        // Container(
        //   color: Colors.black,
        //   child: Column(
        //     children: [
        //       Image.asset("asstes/pic/list.png",),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 45),
        //         child: Text("What do you want to do today?", style: TextStyle(
        //             color: Color(0xFFFFFFFF), fontSize: 20, fontFamily: 'Lato'),),
        //       ),
        //       SizedBox(height: 10,),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 100),
        //         child: Text("Tap + to add your tasks", style: TextStyle(
        //             color: Color(0xFFFFFFFF), fontSize: 16, fontFamily: 'Lato'),),
        //       ),
        //
        //       // ListView.builder(
        //       //   itemBuilder: (BuildContext context, index)  {
        //       //   return Column(
        //       //     children: [
        //       //       Text("${l2[index]}",style: TextStyle(color: Colors.white),),
        //       //     ],
        //       //   );
        //       // },)
        //
        //
        //       // StreamBuilder(
        //       //
        //       //    stream: firebase().firestore.,
        //       //
        //       //    //   builder: (context, snapshot) {},
        //       //    // );
        //       //    builder: (context, snapshot) {
        //       //      return !snapshot.hasData ? Text('PLease Wait') : ListView.builder(
        //       //
        //       //        itemCount: snapshot.data.documents.length,
        //       //        itemBuilder: (context, index) {
        //       //          DocumentSnapshot products = snapshot.data.documents[index];
        //       //          return ProductItem(
        //       //            name: products['name'],
        //       //            imageUrl: products['imageURL'],
        //       //            price: products['price'],
        //       //            discription: products['description'],
        //       //          );
        //       //        },
        //       //      );
        //       //    },
        //       //  ),
        //
        //     ],
        //   ),
        // ),

        floatingActionButton: Container(
          height: 55,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF8687E7),
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 350,
                      width: 100,
                      color: Color(0xFF363636),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Text(
                              "Add Task",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: title,
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
                                hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF), fontFamily: 'Lato',fontSize: 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              controller: description,
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
                                hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),fontSize: 14, fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "asstes/pic/timer.png",
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.asset(
                                  "asstes/pic/tag.png",
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.asset(
                                  "asstes/pic/flag.png",
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Image.asset(
                                  "asstes/pic/send.png",
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 30),
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () async {
                                  print("$title");
                                  print("$description");
                                  firebase().addData(
                                      title: title.text,
                                      description: description.text);
                                  title.clear();
                                  description.clear();
                                  Navigator.pop(context);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => data(),));


                                  //  firebase db= firebase();
                                  // List<Iterable<ToDoMedel>>l1= await firebase.readData();
                                  // setState(() {
                                  //   l2=l1 ;
                                  //
                                  // });
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF8875FF))),
                                child: Text("SAVE"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
// showAlertDialog(BuildContext context) {
//
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("UPDATE"),
//     onPressed: () {
//       // firebase().updateData(title: snapshot.data![index].title);
//     },
//   );
//
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child: TextField(
//         controller: title,
//         style: TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.black,
//             ),
//           ),
//           enabledBorder: UnderlineInputBorder(
//
//             borderSide: BorderSide(
//               width: 2,
//               color: Colors.black,
//
//             ),
//           ),
//           // enabledBorder: OutlineInputBorder(
//           //   borderSide: BorderSide(
//           //     width: 2,
//           //     color: Color(0xFFFFFFFF),
//           //   ),
//           // ),
//           // labelText: 'Enter Name',
//           hintText: 'Write Your Work',
//           hintStyle: TextStyle(
//               color: Color(0xFFFFFFFF), fontFamily: 'Lato'),
//
//         ),
//       ),
//     ),
//     content: Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: 30, vertical: 10),
//       child: TextField(
//         controller: description,
//         style: TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.black,
//             ),
//           ),
//           enabledBorder: UnderlineInputBorder(
//
//             borderSide: BorderSide(
//               width: 2,
//               color: Colors.black,
//
//             ),
//           ),
//           // enabledBorder: OutlineInputBorder(
//           //   borderSide: BorderSide(
//           //     width: 2,
//           //     color: Color(0xFFFFFFFF),
//           //   ),
//           // ),
//           // labelText: 'Enter Name',
//           hintText: 'Description',
//           hintStyle: TextStyle(
//               color: Color(0xFFFFFFFF), fontFamily: 'Lato'),
//
//         ),
//       ),
//     ),
//     actions: [
//       okButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
}
