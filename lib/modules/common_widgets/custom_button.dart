import 'package:email_auth_firebase_learn/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;

  const CustomButton({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.textFieldColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.myWhite,
            ),
          ),
        ),
      ),
    );
  }
}
