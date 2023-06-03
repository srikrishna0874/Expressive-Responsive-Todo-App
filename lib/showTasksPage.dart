import 'package:flutter/material.dart';

class ShowTasksPage extends StatefulWidget {
  const ShowTasksPage({Key? key}) : super(key: key);

  @override
  State<ShowTasksPage> createState() => _ShowTasksPageState();
}

class _ShowTasksPageState extends State<ShowTasksPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.1,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: screenWidth*0.08,
                      backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
                    )
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
