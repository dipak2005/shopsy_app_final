// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopsy_app/model/dbhelper.dart';
import 'package:shopsy_app/view/homepage.dart';
import 'package:shopsy_app/view/login/signin.dart';
import 'package:shopsy_app/view/splash.dart';
import 'firebase_options.dart';

import 'view/login/loginpage.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper helper = DBHelper();
  helper.initDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/",
      routes: {"/": (p0) => Splash(), "home": (p0) => HomePage()},
    );
  }
}
