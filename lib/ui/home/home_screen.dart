import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_gallery_flutter/ui/auth/login_screen.dart';
import 'package:my_gallery_flutter/ui/home/widgets/gallery_card.dart';
import 'package:my_gallery_flutter/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const tag = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    String arguments = ModalRoute.of(context)?.settings.arguments as String;
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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 2.0, start: 16),
                    child: Text("Welcome\n $arguments", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 2,horizontal: 16.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage('https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-2379004.jpg&fm=jpg'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
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
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                                        child: GestureDetector(
                                          child: Container(
                                              decoration: BoxDecoration(
                                              color: Color(0xffefd8f9),
                                              borderRadius: BorderRadius.circular(16)
                                            ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.only(end: 6),
                                                      child: Image.asset(AppImages.galleryIcon, width: 27,height: 27,),
                                                    ),
                                                    Text("Gallery", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                                        child: GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffefd8f9),
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.only(end: 6),
                                                    child: Image.asset(AppImages.cameraIcon, width: 32,height: 32,),
                                                  ),
                                                  Text("Camera", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          );
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.count(
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                      children: List.generate(100, (index) {
                        return GalleryCard();
                      }),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


