import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../pages/Home_Page.dart';
import '../../pages/login_page.dart';
import '../../pages/register_page.dart';

class AuthGate extends StatefulWidget {
  @override
  _AuthGateState createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final loggedInEmail = FirebaseAuth.instance.currentUser?.email ?? "Unknown";
            return Homepage(loggedInEmail: loggedInEmail);
          } else {
            return showLogin
                ? LoginPage(onTap: togglePages)
                : RegisterPage(onTap: togglePages);
          }
        },
      ),
    );
  }
}
