import 'package:flutter/material.dart';
import 'package:uptodate/module/createroutine.dart';
import 'package:uptodate/module/homescreen.dart';

class manage extends StatefulWidget {
  const manage({Key? key}) : super(key: key);

  @override
  _manageState createState() => _manageState();
}

class _manageState extends State<manage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homepage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        " SKIP",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "asstes/pic/manage.png",
                height: 250,
              ),
              SizedBox(
                height: 50,
              ),
              Center  (
                child: Text(
                  "Manage your tasks",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24,
                      fontFamily: 'Lato'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "You can easily manage all of your daily\n                   tasks in DoMe for free",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontFamily: 'Lato'),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "  BACK",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => routine(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF8875FF))),
                        child: Text(
                          "NEXT",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
