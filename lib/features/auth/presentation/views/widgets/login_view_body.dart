import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/utils/values_manager.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/core/widgets/password_filed.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruits_app/main.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autoValidateMode =AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email ,password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
               CustomTextFormField(
                 onSaved: (value){
                   email = value!;
                 },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value){
                  password = value!;
                },
              ),

              // ),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.end,
                "نسيت كمله المرور ؟",
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              const SizedBox(height: 33),
              CustomButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(email, password);
                  }else{
                    autoValidateMode = AutovalidateMode.always;
                  }
                },
                text: "تسجيل الدخول",
              ),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 49),
              const OrDividerWidget(),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة جوجل", image: Assets.imagesGoogleIcon, onPressed: (){}),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة أبل", image: Assets.imagesAppleIcon, onPressed: (){}),
              const SizedBox(height: 16),
              SocialLoginButton(title: "تسجيل بواسطة فيسبوك", image: Assets.imagesFacebookIcon, onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
