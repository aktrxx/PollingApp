import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{

  final googleSignIn = GoogleSignIn();
   
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async{
    try{
    final googleUser = await googleSignIn.signIn().catchError(() {
                throw new StateError('Google Sign in aborted');});

    if(googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication.catchError(() {
                throw new StateError('Google Sign in aborted');
        });

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    

    await FirebaseAuth.instance.signInWithCredential(credential) 
    .catchError((onError) {
            print("error $onError");
          });
    
    }
    on PlatformException catch(a){
      print(a.toString());
      GoogleSignIn();
    }
    notifyListeners();
  }

  
  Future logout() async{
    bool userSignedIn = await googleSignIn.isSignedIn();
    try{
    if(userSignedIn){  
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    }
    else{
        FirebaseAuth.instance.signOut();
    }
    }
    catch(e){
      print(e.toString());
    }
  }
  
  
  
}
