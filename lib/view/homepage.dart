// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy_app/controller/homecontroller.dart';
import 'package:shopsy_app/controller/addproduct.dart';
import 'package:shopsy_app/model/add_product_model.dart';
import 'package:shopsy_app/model/dbhelper.dart';
import 'package:shopsy_app/model/product.dart';

import '../model/database/product_model.dart';
import '../model/logn& signup.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopsy Mart"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("product").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var detail = snapshot.data?.docs ?? [];

            return ListView.builder(
              shrinkWrap: true,
              itemCount: detail.length,
              itemBuilder: (context, index) {
                var productDetail = detail[index];
                return Card(
                  child: ListTile(
                    // leading: Image(
                    //   image: MemoryImage(base64Decode(productDetail[
                    //       "image".replaceAll(".", "/").replaceAll("+", "/")])),
                    // ),
                    title: Text(productDetail["name"]),
                    subtitle: Text(productDetail["discription"]),
                    trailing: CircleAvatar(
                      child: IconButton(
                        onPressed: () async {
                          Product newProduct = Product(
                              name: productDetail["name"],
                              price: productDetail["price"],
                              description: productDetail["discripiton"],
                              image: productDetail["image"]);
                          DBHelper helper = DBHelper();
                          await helper.insertProduct(newProduct);
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Product"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage(false);
                        },
                        child: Stack(
                          children: [
                            Obx(
                              () => CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(filepath.value),
                                ),
                                child: (filepath.value.isEmpty)
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.camera_alt_outlined))
                                    : SizedBox.shrink(),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    pickImage(false);
                                  },
                                  icon: Icon(Icons.photo_outlined)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "* Plz Enter Product Name";
                            } else {
                              return null;
                            }
                          },
                          controller: name,
                          onFieldSubmitted: (value) {},
                          decoration: InputDecoration(
                            hintText: "Enter Product Name",
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green)),
                            suffixIcon: Icon(Icons.edit, color: Colors.green),
                            hintStyle: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "* Plz Enter Product Prize";
                            } else {
                              return null;
                            }
                          },
                          controller: price,
                          onFieldSubmitted: (value) {},
                          decoration: InputDecoration(
                            hintText: "Enter  Product Price",
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green)),
                            suffixIcon: Icon(Icons.edit, color: Colors.green),
                            hintStyle: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "* Plz Enter Product Discription";
                            } else {
                              return null;
                            }
                          },
                          controller: description,
                          onFieldSubmitted: (value) {},
                          decoration: InputDecoration(
                            hintText: "Enter Description",
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green)),
                            suffixIcon: Icon(Icons.edit, color: Colors.green),
                            hintStyle: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("product")
                            .doc(DateTime.now().toString())
                            .set(Product(
                                    name: name.text,
                                    price: price.text,
                                    description: description.text,
                                    image: filepath.value)
                                .toJson());
                        Get.back();
                      },
                      child: Text("Yes"),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add_shopping_cart)),
    );
  }
}
