import 'package:email_auth_firebase_learn/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  CustomTextField(
                    controller: emailController,
                    prefix: Icons.email_outlined,
                    hintText: "Email",

                  ),
                        
                  SizedBox(
                    height: 20,
                  ),
                        
                  CustomTextField(
                    controller: passwordController,
                    prefix: Icons.password_outlined,
                    hintText: "Password",
                  ),
                        
                  SizedBox(
                    height: 20,
                  ),
                        
                        
                  CustomButton(
                    buttonText: "Login",
                    onTap: (){
                      print(emailController);
                    },
                  ),
                        
                        
                        
                ],
              ),
            ),
          ),
        ),
      ),
    
    );
  }
}
