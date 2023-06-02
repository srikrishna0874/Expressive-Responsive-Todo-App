import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:todo/login_page.dart';
import 'package:todo/signup_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 101, 36, 1),
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            DelayedDisplay(
              fadingDuration: Duration(milliseconds: 2000),
              slidingBeginOffset: Offset(1.0, 0.0),
              //slidingCurve: Curves.bounceInOut,
              delay: Duration(milliseconds: 500),
              child: Center(
                child: Image.asset(
                  "assets/images/todo_intro.png",
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.5,
                ),
              ),
            ),
            DelayedDisplay(
              slidingBeginOffset: Offset(-1.0, 0.0),
              fadingDuration: Duration(milliseconds: 2000),
              //slidingCurve: Curves.bounceInOut,
              delay: Duration(milliseconds: 1000),
              child: Text(
                "Todo List",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.1,
                ),
              ),
            ),
            DelayedDisplay(
              slidingBeginOffset: Offset(-1.0, 0.0),
              fadingDuration: Duration(milliseconds: 2000),
              //slidingCurve: Curves.bounceInOut,
              delay: Duration(milliseconds: 1000),
              child: Text(
                "Management",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.1,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            DelayedDisplay(
              fadingDuration: Duration(milliseconds: 2000),
              slidingBeginOffset: Offset(1.0, 0.0),
              //slidingCurve: Curves.bounceInOut,
              delay: Duration(milliseconds: 1500),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyLoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.5, screenHeight * 0.05),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 101, 36, 1),
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            DelayedDisplay(
              slidingBeginOffset: Offset(-1.0, 0.0),
              fadingDuration: Duration(milliseconds: 2500),
              //slidingCurve: Curves.bounceInOut,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MySignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.5, screenHeight * 0.05),
                  backgroundColor: Color.fromRGBO(255, 101, 36, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
