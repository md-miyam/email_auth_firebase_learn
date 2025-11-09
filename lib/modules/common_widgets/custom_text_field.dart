import 'package:flutter/material.dart';
import 'package:email_auth_firebase_learn/utils/app_color.dart';

class CustomTextField extends StatefulWidget {
  final IconData prefix;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.prefix,
    required this.hintText,
    required this.controller,
    this.isPassword = false, this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.textFieldColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(widget.prefix, color: AppColor.textColor),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: TextStyle(color: AppColor.textColor),
                controller: widget.controller,
                cursorColor: AppColor.myWhite,
                keyboardType: widget.keyboardType,
                obscureText: widget.isPassword ? _obscure : false,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColor.textColor,
                  ),
                  border: InputBorder.none,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.textColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
