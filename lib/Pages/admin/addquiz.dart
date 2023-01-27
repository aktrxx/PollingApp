// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final List<Map> questions = [];

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  DateTime date = DateTime(2022, 12, 24);
  int id = 1;
  final quesCon = TextEditingController();
  final o1Con = TextEditingController();
  final o2Con = TextEditingController();
  final o3Con = TextEditingController();
  final o4Con = TextEditingController();
  final cAns = TextEditingController();

  void clearText() {
    questions.add({
      'Question 1': quesCon.text.toString(),
      'options': [
        o1Con.text.toString(),
        o2Con.text.toString(),
        o3Con.text.toString(),
        o4Con.text.toString(),
      ],
      'id': id,
      'ans': int.parse(cAns.text.toString()) - 1,
    });
    quesCon.clear();
    o1Con.clear();
    o2Con.clear();
    o3Con.clear();
    o4Con.clear();
  }

  Future addToFirebase() async {
    final docUser =
        FirebaseFirestore.instance.collection('quiz').doc('Array dyn');

    final json = {
      // 'name': nameController.text,
      // 'regno': regnoController.text,
      // 'department': dropdownValue,
      // 'test array': ['visual', 'arts']
      'q': questions
      // [
      //   {
      //     'Question 1': "What is your name",
      //     'options': [
      //       'Options 1',
      //       'Options 2',
      //       'Options 3',
      //       'Options 4',
      //     ],
      //     'id': 1,
      //     'ans': 3
      //   },
      //   {
      //     'Question 1': "What is your name",
      //     'options': [
      //       'Options 1',
      //       'Options 2',
      //       'Options 3',
      //       'Options 4',
      //     ],
      //     'id': 1,
      //     'ans': 3
      //   }
      // ]
    };

    await docUser.set(json);

  }

  String dropdownvalue = 'Item 1';
  var selectedValue = 0;
  var items = [
    0,
    1,
    2,
    3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: true,

        //resizeToAvoidBottomInset: true
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 169, 5, 51),
          title: Text("Add poll!"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 36, // add custom icons also
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: quesCon,
                    decoration: InputDecoration(labelText: 'Question'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: o1Con,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'Option 1'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: o2Con,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'Option 2'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: o3Con,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'Option 3'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: o4Con,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'Option 4'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: cAns,
                    // keyboardType: TextInputType.multiline,
                    // maxLines: null,
                    decoration:
                        InputDecoration(labelText: 'Give the correct option'),
                    textAlign: TextAlign.start,
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    cursorWidth: 3),
              ),
//               DropdownButton<int>(
//   value: selectedValue,
//   items: [1, 2, 3, 4].map((int value) {
//     return DropdownMenuItem<int>(
//       value: value,
//       child: Text(value.toString()),
//     );
//   }).toList(),
//   onChanged: (int? newValue) {
//     setState(() {
//       selectedValue = newValue!;
//     });
//   },
// ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: clearText, child: Text('Add')),
                  ElevatedButton(onPressed: addToFirebase, child: Text('Post'))
                ],
              )
            ],
          ),
        ));
  }
}
