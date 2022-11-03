
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_flutter/ui/auth/login_screen.dart';
import 'package:my_gallery_flutter/ui/home/widgets/gallery_card.dart';
import 'package:my_gallery_flutter/ui/home/widgets/welcome_header.dart';
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
              WelcomeHeader(arguments: arguments),
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
                              builder: (context) => buildDialog()
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

  Dialog buildDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  pickImage(ImageSource.gallery);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffefd8f9),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 6),
                          child: Image.asset(
                            AppImages.galleryIcon,
                            width: 27,
                            height: 27,
                          ),
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  pickImage(ImageSource.camera);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffebf6ff),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 6),
                          child: Image.asset(
                            AppImages.cameraIcon,
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      XFile? _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(_image == null) return;
      final imageTemp = File(_image.path);
      print("image temp $imageTemp");
      //setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}




