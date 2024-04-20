  import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController name=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController discription=TextEditingController();
TextEditingController price=TextEditingController();
  RxString filepath = "".obs;

  void pickImage(bool isCamara) async {
    XFile? file = await ImagePicker()
        .pickImage(
        source: isCamara ? ImageSource.camera : ImageSource.gallery);
    filepath.value = file!.path;
  }




