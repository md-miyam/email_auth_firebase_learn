import 'package:email_auth_firebase_learn/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColor.textFieldColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(Icons.email_outlined,color: AppColor.backgroundColor,),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: TextField(
                  cursorColor: AppColor.myWhite,

                  cursorHeight: 18,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 16,color: AppColor.textColor),
                    border: InputBorder.none,

                  ),

                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
