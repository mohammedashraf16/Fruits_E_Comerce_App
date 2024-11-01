import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';

Future<dynamic> buildErrorDialog(BuildContext context,String message) {
  return AwesomeDialog(
    btnOkColor: AppColors.primaryColor,
    autoDismiss: true,
    customHeader: const Icon(
      Icons.error,
      color: Colors.red,
      size: 80,),
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    body: Center(
      child: Text(
        message,
      ),
    ),
    title: 'Error',
    desc: message,
    btnOkOnPress: () {},
  ).show();
}
