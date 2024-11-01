import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key, required this.onChanged});
final ValueChanged<bool> onChanged;


  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
 bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(1, 0),
      child: Row(
        children: [
          CustomCheckBox(
            isChecked: isTermsAccepted,
            onChecked: (bool value) {
              isTermsAccepted=value;
              widget.onChanged(value);
              setState(() {

              });
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "من خلال إنشاء حساب ، فإنك توافق على",
                  style: TextStyles.semiBold13),
              TextSpan(
                  text: " الشروط والأحكام الخاصة بنا",
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xff2D9F5D)))
            ])),
          )
        ],
      ),
    );
  }
}
