import 'package:flutter/material.dart';
import 'package:my_gallery_flutter/ui/auth/login_screen.dart';
import 'package:my_gallery_flutter/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const tag = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.galleryBackground),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 24.0, start: 16),
                  child: Text("Welcome", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            children: [


                              Image.asset(AppImages.logoutIcon, width: 24, height: 24,),
                              SizedBox(width: 10,),
                              Text("Logout", style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 30),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            children: [
                              Image.asset(AppImages.uploadIcon, width: 24, height: 24,),
                              SizedBox(width: 10,),
                              Text("Upload", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              ///gallery grid goes here
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Container(
                    color: Colors.green,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
