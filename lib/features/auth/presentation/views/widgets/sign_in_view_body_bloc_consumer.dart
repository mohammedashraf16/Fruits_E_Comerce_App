import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_functions/build_error_dialog.dart';
import 'package:fruits_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/login_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {}
        if (state is SignInFailure) {
          buildErrorDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading:state is SignInLoading? true:false,
            child: const LoginViewBody());
      },
    );
  }
}


