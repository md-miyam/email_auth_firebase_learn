import 'package:email_auth_firebase_learn/modules/home/home_view/home_view.dart';
import 'package:email_auth_firebase_learn/modules/verify_email/verify_email_view/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login/login_view/login_view.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data!.emailVerified) {
              return HomeView();
            } else {
              return VerifyEmailView();
            }
          } else {
            return LoginView();
          }
        },
      ),
    );
  }
}
