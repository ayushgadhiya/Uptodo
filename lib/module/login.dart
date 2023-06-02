import 'package:flutter/material.dart';
import 'package:uptodate/module/homescreen.dart';
import 'package:uptodate/module/login.dart';
import 'package:uptodate/module/signup.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: ListView(
            children:[
              SizedBox(
                height: 77.25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asstes/pic/manage.png",height: 130,),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Log In ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                        fontSize: 21,
                        fontFamily: 'Gilroy',
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),




              Container(
                margin: EdgeInsets.all(20),
                child: TextField(

                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Color(0xFF8875FF)),

                      borderRadius: BorderRadius.circular(15),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color:Color(0xFF8875FF)),

                    ),
                    // label:  Icon(Icons.search_sharp),
                    label: Text("E-mail",
                      style: TextStyle(
                          color:Color(0xFF8875FF),

                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                   style: TextStyle(
                     color: Color(0xFFFFFFFF),
                   ),
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Color(0xFF8875FF)),

                      borderRadius: BorderRadius.circular(15),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color:Color(0xFF8875FF)),

                    ),
                    // label:  Icon(Icons.search_sharp),
                    label: Text("Password",
                      style: TextStyle(
                          color: Color(0xFF8875FF),

                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ),
              ),



              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Flexible(

                      child: Text(
                        "By continuing you agree to our ",
                        softWrap: false,

                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 10,
                            fontFamily: 'Gilroy',
                            wordSpacing: 2),
                      ),
                    ),
                  ),
                  Text(
                    "Terms and Service ",
                    style: TextStyle(
                        color: Color(0xFF8875FF),
                        fontSize: 10,
                        fontFamily: 'Gilroy',
                        wordSpacing: 2),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "and ",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 10,
                          fontFamily: 'Gilroy',
                          wordSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                      "Privacy Policy ",
                      style: TextStyle(
                          color: Color(0xFF8875FF),
                          fontSize: 10,
                          fontFamily: 'Gilroy',
                          wordSpacing: 2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => homepage(),));
                  },
                  child: Container(
                    height: 50,
                    // width: 280,
                    decoration: BoxDecoration(
                        color: Color(0xFF8875FF),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Log In ",
                          style: TextStyle(
                              color: Color(0xFFFFF9FF),
                              fontSize: 16,
                              letterSpacing: 1,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                          fontSize: 12,
                          fontFamily: 'Gilroy',
                          wordSpacing: 2),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                        },
                        child: Text(
                          "Sign Up  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8875FF),
                              fontSize: 12,
                              fontFamily: 'Gilroy',
                              wordSpacing: 2),
                        )),
                  ),
                ],
              ),],
          ),
        ),
      ),
    );
  }
}
