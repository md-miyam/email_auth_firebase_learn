import 'package:email_auth_firebase_learn/modules/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../utils/app_color.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  initState() {
    sendVerifyLink();
    super.initState();
  }

  sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then(
      (onValue) => {
        Get.snackbar(
          "Link send",
          "A link has been send to your email",
          margin: EdgeInsets.all(30),
          snackPosition: SnackPosition.BOTTOM,
        ),
      },
    );
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then(
      (onValue) => {Get.offAll(Wrapper())},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verify Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 80),

                Text(
                  'Open you r email and click the link provided to verify mail & reload the page. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => reload(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
