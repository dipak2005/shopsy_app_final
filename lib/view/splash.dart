// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy_app/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              "assets/def.png",
              fit: BoxFit.cover,
            )),
            Text(
              "Shopsy Mart",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
