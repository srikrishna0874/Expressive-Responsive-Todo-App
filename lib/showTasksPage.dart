import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/utils/profile.dart';

import 'addTasksPage.dart';

class ShowTasksPage extends StatefulWidget {
  const ShowTasksPage(Profile profile, {Key? key}) : super(key: key);

  @override
  State<ShowTasksPage> createState() => _ShowTasksPageState();
}

class _ShowTasksPageState extends State<ShowTasksPage> {
  String truncateFun(String text, int mal) {
    if (text.length <= mal) {
      return text;
    }
    final truncatedText = text.substring(0, mal);
    final lastSpaceIndex = truncatedText.lastIndexOf(' ');
    return truncatedText.substring(0, lastSpaceIndex) + '...';
  }

  String longText = "Sri Krishna Venkata Subbarao";

  List<String> ele = [
    "Hi",
    "Hello",
    "World",
    "Sri",
    "Krishna",
    "Venkata",
    "Subbarao"
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String truncateText = truncateFun(longText, 11);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.15,
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.23,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.redAccent,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile_pic.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Tooltip(
                            message: longText,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 101, 36, 1),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  offset: Offset(10, 10),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.1,
                                  ),
                                ),
                                Text(
                                  truncateText,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 101, 36, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.008,
                          ),
                          Container(
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 8),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Color.fromRGBO(255, 101, 36, 1),
                                ),
                                hintText: "Search",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.0008,
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Recently added",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ele.map((value) {
                            return Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.08,
                              margin: EdgeInsets.only(right: 5.0, left: 5.0),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8.0),
                                      color: Colors.orange,
                                      width: 4.0,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 8.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Hello"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      children: [
                        Text(
                          "Tasks List",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: ele.map((value) {
                            return Container(
                              width: screenWidth,
                              height: screenHeight * 0.08,
                              margin: EdgeInsets.only(
                                  right: 5.0, left: 5.0, bottom: 10.0),
                              padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: screenWidth * 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8.0),
                                      color: Colors.orange,
                                      width: 4.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CircularPercentIndicator(
                                        animation: true,
                                        startAngle: 0.0,
                                        animationDuration: 1500,
                                        radius: screenWidth * 0.06,
                                        percent: 0.75,
                                        progressColor:
                                            Color.fromRGBO(255, 101, 36, 1),
                                        center: Text(
                                          "75%",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.03,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0, left: 8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Hello"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTasks()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 101, 36, 1),
                        minimumSize:
                            Size(screenWidth * 0.7, screenHeight * 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle),
                          SizedBox(
                            width: screenWidth*0.01,
                          ),
                          Text("Create Task",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth*0.045,
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
