// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:poll/Pages/AddPoll.dart';
import 'package:poll/Pages/admin/addquiz.dart';
import 'package:poll/Pages/groups.dart';
import 'package:poll/Pages/navbar.dart';
import 'package:poll/Pages/qr.dart';
import 'package:poll/Pages/quiz/quiz_screen.dart';
import 'package:poll/Pages/quizpage.dart';
//import 'package:poll/Widgets/Question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String radioItem = '';
  final _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddQuiz()))),
        label: Text('Create Your Own quiz'),
      ),
      appBar: AppBar(
          title: Text('HOME'),
          backgroundColor: Color.fromARGB(255, 4, 17, 118)),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/treee.jpg"), fit: BoxFit.cover),
        ),
        child: PageView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: TextField(
                    controller: _codeController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.greenAccent),
                      ),
                      hintText: 'Enter Code',

                      //fillColor: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 60,
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.5),
                      ),
                      onPressed: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen()))),
                      child: Text('ENTER POLL')),
                ),
                SizedBox(height: 90),
                SizedBox(
                  height: 150,
                  width: 260,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromARGB(255, 255, 250, 250).withOpacity(0.5),
                      ),
                      onPressed: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Groups()))),
                      child: Text('GROUPS')),
                ),
              ],
            ),
          ),
          QRScan()
        ]),
      ),
      drawer: navbar(),
    );
  }
}

// SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             SizedBox(height: 5,),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: QuestionBlock(),
//             ),
//           ],
//         ),
//       ),
