import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../login/login_view/login_view.dart';
import '../../wrapper/wrapper.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    Get.offAll(Wrapper());
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
                  'Register',
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

                CustomButton(
                  buttonText: "Sign up",
                  onTap: () {
                    signUp();
                  },
                ),

                SizedBox(height: 30),

                // Register now text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",

                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginView());
                      },
                      child: Text(
                        "Login",
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
