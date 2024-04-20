import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopsy_app/model/add_product_model.dart';
import 'package:shopsy_app/model/database/product_model.dart';
import 'package:shopsy_app/model/dbhelper.dart';
import 'package:shopsy_app/model/logn&%20signup.dart';
import 'package:shopsy_app/model/product.dart';

class HomeController extends GetxController {
  var proImage = base64Decode(filepath.value);
  var imageData;

  void image() {
    if (filepath.value.isNotEmpty) {
      var file = File(filepath.value);
      imageData = file.readAsBytes();
    }
  }

  void fillData(Product product) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.insertProduct(product.name ?? '', product.description ?? "",
        product.image ?? "", product.price ?? "",);
  }
}
