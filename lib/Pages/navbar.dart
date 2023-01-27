import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poll/Pages/profile.dart';
import 'package:poll/pages/google_sign_in.dart';
// import 'package:poll/Pages/home_p.dart';
import 'package:provider/provider.dart';

class navbar extends StatelessWidget {
  navbar({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  getProfileImage() {
    if (user.photoURL != null) {
      return Image.network(user.photoURL!);
    } else {
      return Icon(Icons.account_circle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(user.email!),
              currentAccountPicture: CircleAvatar(
                child: InkWell(
                  onTap: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()))),
                  child: ClipOval(
                    child: getProfileImage(),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            ),
          ],
        ));
  }
}
