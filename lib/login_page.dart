import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:text_divider/text_divider.dart';
import 'package:todo/showTasksPage.dart';
import 'package:todo/signup_page.dart';
import 'package:http/http.dart' as http;
import 'package:todo/utils/profile.dart';

import 'db/constants.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisiblePassword = true;
  String message = "";
  Profile profile=Profile();

  Widget buildSuffixIcon() {
    if (isVisiblePassword == true) {
      return IconButton(
        onPressed: () {
          setState(() {
            isVisiblePassword = false;
          });
        },
        icon: Icon(
          Icons.visibility_rounded,
          color: Color.fromRGBO(255, 101, 36, 1),
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            isVisiblePassword = true;
          });
        },
        icon: Icon(
          Icons.visibility_off_rounded,
          color: Color.fromRGBO(255, 101, 36, 1),
        ),
      );
    }
  }

  Widget buildTextfield(String hintText, IconData icon, bool isObscured,
      TextEditingController controller, int ms) {
    return DelayedDisplay(
      delay: Duration(milliseconds: ms),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              spreadRadius: 0,
              blurRadius: 10,
              color: Color.fromRGBO(225, 101, 36, 0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          controller: controller,
          obscureText: isObscured ? isVisiblePassword : false,
          decoration: InputDecoration(
            suffixIcon: isObscured ? buildSuffixIcon() : null,
            prefixIcon: Icon(
              icon,
              color: Color.fromRGBO(255, 101, 36, 1),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

    return passwordRegex.hasMatch(password);
  }

  bool validateForm() {
    final email = emailController.text;
    final password = passwordController.text;
    print(email);
    print(password);

    final isEmailValid = validateEmail(email);

    final isPasswordValid = validatePassword(password);
    print("Email entered:$isEmailValid");
    print(isPasswordValid);
    return isEmailValid && isPasswordValid;
  }

  Future<bool> loginUser(String email, String password) async {
    var reqBody = {"email": email, "password": password};
    print("Called!!");

    try {
      var response = await http.post(
        Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      var jsonResponse = await jsonDecode(response.body);
      print(jsonResponse["status"]);
        var myToken = jsonResponse["token"];
        Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(myToken);
          profile.email = jwtDecodedToken["email"];
          profile.name = jwtDecodedToken["username"];
      print("Profile's email is: ${profile.email}");


      return true;


    } catch (error) {
      print(error);
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 121, 36, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 500),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.1,
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 750),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: screenWidth * 0.8,
                  child: Text(
                    "Let the magic of our app transform your day-to-day tasks into a seamless and enjoyable experience.",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      height: screenHeight * 0.0015,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              buildTextfield("Enter your Email", Icons.email_outlined, false,
                  emailController, 1000),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              buildTextfield("Enter your Password", Icons.lock_outline_rounded,
                  true, passwordController, 1250),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 1500),
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 1750),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      print("Clicked\n\n\n\n\n\n");
                      bool isValidDetails = validateForm();
                      print("isValidDetails: $isValidDetails\n\n\n\n");
                      if (isValidDetails) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: screenHeight * 0.1,
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text("Please wait..."),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        print("Going to call...\n\n\n\n");
                        setState(() async {
                          Future<bool> response = loginUser(
                              emailController.text, passwordController.text);
                          print("login backend done it seems....\n\n\n\n\n");
                          print("Response after login: $response\n\n\n\n\n\n");
                          if (await response) {
                            print(
                                "Name and Email are: ${profile.email}\n\n\n\n${profile.name}");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowTasksPage(profile)),
                            );
                          }
                          else {
                            setState(() {
                              message = "Enter Valid Email/Password";
                            });
                            final snackBar = SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: screenWidth * 0.05,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  Text(
                                    message,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(10),
                              duration: Duration(seconds: 2),
                              dismissDirection: DismissDirection.startToEnd,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            emailController.text = "";
                            passwordController.text = "";
                          }
                        });

                      }

                      /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowTasksPage()),
                      );*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 101, 36, 1),
                      minimumSize: Size(screenWidth, screenHeight * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 2000),
                child: TextDivider.horizontal(
                  text: Text(
                    "Or Login with",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  thickness: 5,
                  color: Color.fromRGBO(255, 101, 36, 1),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 2250),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/google_logo.png",
                          width: screenWidth * 0.2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/facebook_Logo.png",
                          width: screenWidth * 0.12,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/twitter_logo.png",
                          width: screenWidth * 0.12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 2500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
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
    );
  }
}
