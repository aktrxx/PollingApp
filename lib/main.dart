import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_loginbc/pages/google_sign_in.dart';
import 'package:flutter_loginbc/pages/login_p.dart';
import 'package:flutter_loginbc/auth/main_p.dart';
import 'package:provider/provider.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    )
    );
  
}

