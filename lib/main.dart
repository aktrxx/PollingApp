// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:poll/Pages/qr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poll/pages/auth/main_p.dart';
// import 'package:poll/pages/welcome/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:poll/pages/google_sign_in.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  //hi
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: GetMaterialApp(
      title: 'Polling App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    )

    
    );
}