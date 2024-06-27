import 'package:flutter/material.dart';
import 'package:fruits_app/features/splash/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView());
    default :
      return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }
}
