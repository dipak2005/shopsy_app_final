import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsy_app/model/logn&%20signup.dart';
import 'package:shopsy_app/model/product.dart';

class AddProduct {
  static final _instance = AddProduct._();

  AddProduct._();

  factory AddProduct() {
    return _instance;
  }


  void product() async {
    String? image;
    DateTime dateTime = DateTime.now();





    //base memory image:
    if (filepath.isNotEmpty) {
      var file = File(filepath.value);
      var readAsBytes = file.readAsBytesSync();
      image = base64Encode(readAsBytes);
    }

    Product product = Product(
        image: image,
        name: name.text,
        discription: discription.text,
        price: price.text);

    var addData=FirebaseFirestore.instance
        .collection("product")
        .doc(DateTime.now().toString())
        .set(product.toJson());
  }
}
