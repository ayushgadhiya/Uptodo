
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uptodate/module/splashscreen.dart';
import 'package:uptodate/other/copy.dart';
import 'package:uptodate/other/database.dart';
void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

    MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
         '/':(Context)=> splash(),
        // '/':(Context)=> database(),
        // '/':(Context)=> MyApp(),
      },
    ),
  );
}