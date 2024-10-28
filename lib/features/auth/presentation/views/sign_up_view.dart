import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
static const String routeName ="signup";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: "حساب جديد"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SignUpViewBody(),
      ),
    );
  }
}
