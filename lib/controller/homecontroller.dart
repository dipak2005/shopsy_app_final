import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsy_app/model/add_product_model.dart';
import 'package:shopsy_app/model/dbhelper.dart';
import 'package:shopsy_app/model/logn&%20signup.dart';
import 'package:shopsy_app/model/product.dart';

class HomeController extends GetxController {
  // var proImage = base64Decode(filepath.value);
  var image;
  RxString filepath = "".obs;
  String? productName;
  String? productDescription;
  String? productPrice;
  String? productImage;



  void pickImage(bool isCamara) async {
    XFile? file = await ImagePicker()
        .pickImage(
        source: isCamara ? ImageSource.camera : ImageSource.gallery);
    filepath.value = file!.path;

  }




}
