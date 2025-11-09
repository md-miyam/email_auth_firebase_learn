import 'package:email_auth_firebase_learn/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.textFieldColor,
        title: const Text(
          "Home View",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.backgroundColor,

      body: SafeArea(
        child: Center(
          child: Text(
            user?.email ?? "No Email Found",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signOut();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
