import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_functions/build_error_dialog.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/core/widgets/password_filed.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String userName, email,password;
  late bool isTermsAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: "الاسم بالكامل",
                textInputType: TextInputType.text),
            const SizedBox(height: 16),
            CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 16),
             // PasswordField(onSaved: (value) {
             //   password = value!;
             // },),
           PasswordField(
             onSaved: (value){
               password = value!;
             },
           ),
            const SizedBox(height: 16),
            TermsAndConditionWidget(
              onChanged: (value) {
                isTermsAccepted = value;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted == true) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                        email,
                        password,
                        userName,
                      );
                    } else {
                      buildErrorDialog(
                          context, "يجب عليك الموافقه علي الشروط والاحكام");
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "إنشاء حساب جديد"),
            const SizedBox(height: 26),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
