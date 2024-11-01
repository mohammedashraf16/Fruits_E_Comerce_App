import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_functions/build_error_dialog.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          buildErrorDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }

}
