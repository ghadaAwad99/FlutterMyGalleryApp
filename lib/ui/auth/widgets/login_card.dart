import 'package:flutter/material.dart';
import 'package:my_gallery_flutter/ui/auth/widgets/custom_form_field.dart';
import 'package:my_gallery_flutter/ui/auth/widgets/rounded_button.dart';
import 'package:my_gallery_flutter/utils/app_colors.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key, required this.buttonOnPress,
  }) : super(key: key);
  final Function buttonOnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const CustomFormField(
              hintText: "User Name",
              fillColor: AppColors.lightGrey,
              hintColor: AppColors.hintColor,
            ),
            const CustomFormField(
              hintText: "Password",
              fillColor: AppColors.lightGrey,
              hintColor: AppColors.hintColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RoundedButton(
                onPressed: () {
                  buttonOnPress();
                },
                color: AppColors.buttonBlue,
                child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}