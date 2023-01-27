// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  DateTime date = DateTime(2022, 12, 24);
  final quesCon = TextEditingController();
  final o1Con = TextEditingController();
  final o2Con = TextEditingController();
  final o3Con = TextEditingController();
  final o4Con = TextEditingController();
  
  Future addToFirebase() async {
    final docUser = FirebaseFirestore.instance.collection('quiz').doc('ACDjbjEF');

    final json = {
      // 'name': nameController.text,
      // 'regno': regnoController.text,
      // 'department': dropdownValue,
      // 'test array': ['visual', 'arts']

      '1': {
        'Question 1': "What is your name",
        'options': [
          'Options 1',
          'Options 2',
          'Options 3',
          'Options 4',
        ],
        'id': 1,
        'ans': 3
      }
    };

    await docUser.set(json);
    docUser.collection('quiz').add(json).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: true,

        //resizeToAvoidBottomInset: true
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 169, 5, 51),
          title: Text("Add an Event!"),
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
              ElevatedButton(onPressed: addToFirebase, child: Text('Add'))
            ],
          ),
        ));
  }
}
