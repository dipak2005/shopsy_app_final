// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy_app/controller/cartController.dart';
import 'package:shopsy_app/model/product.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CartPage"),
      ),
      body: Obx(
        ()=> ListView.builder(
          shrinkWrap: true,
          itemCount: controller.proList.length,
          itemBuilder: (context, index) {
            Product data=controller.proList[index];
            return Card(
              child: ListTile(
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.memory(base64Decode(data.image??"",),fit: BoxFit.fitWidth),
                  ),
                ),
                title: Text(data.name??"",style: TextStyle( fontSize: 17),),
                subtitle: Text(data.description??"",style: TextStyle(fontSize: 16)),
                trailing: Text("\$ ${data.price??" "}",style: TextStyle(fontSize: 15),),

              ),
            );
          },
        ),
      ),
    );
  }
}
