import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginbc/pages/google_sign_in.dart';
import 'package:flutter_loginbc/pages/login_p.dart';
import 'package:flutter_loginbc/pages/register_p.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 HomePage({super.key});
 final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // ignore: prefer_interpolation_to_compose_strings
            SizedBox(height: 350),
            Text("Signed in as " + user.displayName!),
            MaterialButton(onPressed: (){
              // ignore: non_constant_identifier_names
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            color:  Colors.lightBlue[200],
            child: Text('Sign Out'),
            ),
          ],
        ),
      ),
      
    
    
   
    );
  }
}