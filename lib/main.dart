import 'package:aides_help/users/authentification/splash_page.dart';
import 'package:aides_help/users/dashboard/dashboard.dart';
import 'package:aides_help/users/userPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'users/authentification/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, DataSnapShot) {
          if (DataSnapShot.data == null) {
            return SplashPage();
          } else {
            return Dashboard();
          }
        },
      ),
    );
  }
}
