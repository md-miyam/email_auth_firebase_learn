import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  TextEditingController emailController = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim(),
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
                  'Forgot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                CustomTextField(
                  controller: emailController,
                  prefix: Icons.email_outlined,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20),

                CustomButton(
                  buttonText: "Send link",
                  onTap: () {
                    reset();
                  },
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
