import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "تسجيل الدخول"),
      body: const LoginViewBody(),
    );
  }
}
