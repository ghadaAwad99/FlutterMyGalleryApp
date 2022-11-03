import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_viewModel.dart';
import 'package:my_gallery_flutter/ui/auth/widgets/login_card.dart';
import 'package:my_gallery_flutter/utils/app_colors.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         const Padding(
           padding:  EdgeInsets.all(8.0),
           child: Text(
             "My\n Gallery",
             style: TextStyle(
                 fontSize: 50,
                 fontWeight: FontWeight.bold,
                 color: AppColors.darkGrey,
             ),
             textAlign: TextAlign.center,
           ),
         ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:  ClipRect(
              child:  Stack(
                children: <Widget>[
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: LoginCard(
                      buttonOnPress: () {
                          viewModel.loginUser();
                        },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}






