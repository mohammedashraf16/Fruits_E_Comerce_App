import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: 16),
        Text("أو",style: TextStyles.bold19,),
        SizedBox(width: 16),
        Expanded(child: Divider()),
      ],
    );
  }
}
