import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_gallery_flutter/di/service_locator.dart';
import 'package:my_gallery_flutter/ui/auth/login_screen.dart';
import 'package:my_gallery_flutter/utils/navigation/navigation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    ServiceLocator.init();
  } catch (e) {
    print("start up exception:$e");
  }
  runApp(ProviderScope(child: MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyGallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.tag,
        onGenerateRoute: getApplicationRoute,
        navigatorKey: navigationKey,
      ),
    );
  }
}