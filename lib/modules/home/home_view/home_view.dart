import 'package:email_auth_firebase_learn/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      body: CustomTextField(),

    );
  }
}
