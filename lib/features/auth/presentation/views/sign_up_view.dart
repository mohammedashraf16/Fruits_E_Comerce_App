import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_service.dart';
import 'package:fruits_app/core/widgets/custom_app_bar_widget.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: "حساب جديد"),
        body:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SignupViewBlocConsumer(),
        ),
      ),
    );
  }
}
