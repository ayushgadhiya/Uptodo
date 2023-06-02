import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptodate/other/copy.dart';

class firebase{
  var firestore=FirebaseFirestore.instance.collection(collection).doc();
static String collection = 'UserData';
  addData({String? title,String? description,String? spass,String? semail}){

    ToDoMedel toDoMedel = ToDoMedel(title: title, description: description,docId: firestore.id,semail: semail,spass: spass);

    firestore.set(toDoMedel.toJson());
    // var dataa=firestore.collection(collection).snapshots();
    // print("**${dataa}");

  }

   deleteData({String? docId}){
    // firestore.delete();
    //    ToDoMedel(docId: firestore.id);
    FirebaseFirestore.instance.collection(collection).doc(docId).delete();
     // Firestore.instance.collection('Requests').document(docID).delete();

   }
   updateData({String? utitle,String? udescription,String? docId}) async {
    // print("-------------$docId");
    // print("-------------$utitle");
    // print("-------------$udescription");
    ToDoMedel toDoMedel =ToDoMedel(title: utitle,description: udescription,docId: docId);
   await FirebaseFirestore.instance.collection(collection).doc(docId).update(toDoMedel.toJson());
}


 // Future<ToDoMedel?> readData() async {
 //  var reda = firestore.collection(collection).snapshots();
 //  print("**---------------${jsonDecode(jsonEncode(reda))}");
 //  var r = ToDoMedel.fromJson(jsonDecode(jsonEncode(reda)));
 //  print("**---------------${r}");
 //
 //  return null;
 //
 //
 //  }

  static Stream<List<ToDoMedel>> readData() {
    return FirebaseFirestore.instance.collection(collection).snapshots().map(
            (event) =>
            event.docs.map((e) => ToDoMedel.fromJson(e.data())).toList());
  }
}



class dataSign{
  var firestor=FirebaseFirestore.instance.collection(collection).doc();
  static String collection = 'UseData';
  userData({String? spass,String? semail}){

    Model model = Model(docId: firestor.id,semail: semail,spass: spass);

    firestor.set(model.toJson());
    // var dataa=firestore.collection(collection).snapshots();
    // print("**${dataa}");

  }
}