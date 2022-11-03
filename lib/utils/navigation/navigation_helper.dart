import 'package:flutter/material.dart';
import 'package:my_gallery_flutter/ui/auth/login_screen.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_state.dart';
import 'package:my_gallery_flutter/ui/home/home_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {
  switch (settings.name) {

    case HomeScreen.tag:
      return _buildScreen(settings, const HomeScreen());

    case LoginScreen.tag:
      return _buildScreen(settings, const LoginScreen());

    default:
      throw Exception("un registered route");
  }
}

PageRouteBuilder _buildScreen(RouteSettings settings, Widget screen){
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child)
  );
}