import 'package:email_auth_firebase_learn/modules/forgot/forgot_view/forgot_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../signup/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
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
                  'Login',
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

                CustomTextField(
                  controller: passwordController,
                  prefix: Icons.password_outlined,
                  hintText: "Password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ForgotView());
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                CustomButton(
                  buttonText: "Login",
                  onTap: () {
                    signIn();
                    print(emailController.text);
                    print(passwordController.text);
                  },
                ),

                SizedBox(height: 30),

                // Register now text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",

                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(SignupView());
                      },
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
