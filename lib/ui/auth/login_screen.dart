import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/ui/auth/state/login_viewModel.dart';
import 'package:my_gallery_flutter/ui/auth/widgets/login_card.dart';
import 'package:my_gallery_flutter/utils/app_colors.dart';
import 'package:my_gallery_flutter/utils/app_images.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.loginBackground),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
           const Padding(
             padding:  EdgeInsets.all(5.0),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(AppImages.galleryIcon),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(AppImages.circlesBackground),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(AppImages.squareBackground),
                          ),
                        ],
                      ),
                    ),

                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: LoginCard(
                        usernameController: viewModel.usernameController,
                        passwordController: viewModel.passwordController,
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
        ),
      )
    );
  }
}






