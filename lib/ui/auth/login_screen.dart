import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_viewModel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const tag = "LoginScreen";

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = ref.read(loginViewModelProvider!.notifier);
    return Scaffold(
      body: Column(
        children:  [
        const Center(
          child: Text(
            "My\n Gallery",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A4A4A),
            ),
            textAlign: TextAlign.center,
          ),
        ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: new Center(
              child: new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)
                    ),
                    child: Column(
                      children: [
                        Text("Login")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
      )
    );
  }
}
