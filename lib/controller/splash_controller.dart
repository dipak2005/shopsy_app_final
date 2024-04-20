import 'dart:async';

import 'package:get/get.dart';
import 'package:shopsy_app/view/homepage.dart';

class SplashController extends GetxController {
  void timer() {

  }

  @override
  void onInit() {
   Timer(Duration(seconds: 2), () {
     Get.off(() =>  HomePage());
   });
    super.onInit();
  }


}
