import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

enum Priority {
  Low,
  Medium,
  High,
  none,
}

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final String currentDateTime =
      DateFormat('MMMM d,y HH:mm:ss').format(DateTime.now());
  Priority selectedPriority = Priority.none;
  List<TextEditingController> subTasksControllers = [];

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        final formattedDateTime =
            DateFormat('MMMM d, y HH:mm:ss').format(selectedDateTime);
        dateController.text = formattedDateTime;
      }
    }
  }

  void changePriority(Priority priority) {
    setState(() {
      selectedPriority = priority;
    });
    print("${selectedPriority}");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "Create new task",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.08),
                    ),
                    Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                      size: screenWidth * 0.08,
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.0008,
                color: Colors.black,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * 0.03, right: screenWidth * 0.03),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Task Name",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 101, 36, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: taskController,
                        cursorColor: Color.fromRGBO(255, 101, 36, 1),
                        cursorHeight: screenHeight * 0.03,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: screenHeight * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.task_alt_rounded,
                            color: Color.fromRGBO(255, 101, 36, 1),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter your Task Name",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Due Date",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 101, 36, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: dateController,
                        onTap: () {
                          _selectDateTime(context);
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: currentDateTime,
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: Color.fromRGBO(255, 101, 36, 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: screenHeight * 0.02,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Choose priority",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 101, 36, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: selectedPriority != Priority.Low
                              ? () {
                                  changePriority(Priority.Low);
                                  print("${selectedPriority}");
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(59, 219, 56, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize:
                                Size(screenWidth * 0.2, screenHeight * 0.045),
                            elevation: 8.0,
                          ),
                          child: Text("Low"),
                        ),
                        ElevatedButton(
                          onPressed: selectedPriority != Priority.Medium
                              ? () {
                                  changePriority(Priority.Medium);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(251, 195, 67, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize:
                                Size(screenWidth * 0.2, screenHeight * 0.045),
                            elevation: 8.0,
                          ),
                          child: Text("Medium"),
                        ),
                        ElevatedButton(
                          onPressed: selectedPriority != Priority.High
                              ? () {
                                  changePriority(Priority.High);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 81, 81, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize:
                                Size(screenWidth * 0.2, screenHeight * 0.045),
                            elevation: 8.0,
                          ),
                          child: Text("High"),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: subTasksControllers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sub-Task Name${index + 1}",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 101, 36, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 1),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    color: Colors.grey,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextField(
                                controller: subTasksControllers[index],
                                cursorColor: Color.fromRGBO(255, 101, 36, 1),
                                cursorHeight: screenHeight * 0.03,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: screenHeight * 0.02,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.add_task_rounded,
                                    color: Color.fromRGBO(255, 101, 36, 1),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.delete_forever_rounded,
                                      color: Color.fromRGBO(255, 101, 36, 1),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        subTasksControllers.removeAt(index);
                                      });
                                    },
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText:
                                      "Enter your Sub-Task Name${index + 1}",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              TextEditingController controller =
                                  TextEditingController();
                              subTasksControllers.add(controller);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Color.fromRGBO(255, 101, 36, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text("Add New Sub-Task"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 101, 36, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        maxLines: 3,
                        controller: taskController,
                        cursorColor: Color.fromRGBO(255, 101, 36, 1),
                        cursorHeight: screenHeight * 0.03,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: screenHeight * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.description_rounded,
                            color: Color.fromRGBO(255, 101, 36, 1),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter some description about your task...",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                backgroundColor:
                                    Color.fromRGBO(255, 101, 36, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "Add Task",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text("Clear"),
                          ),
                        ),
                      ],
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
