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
import 'package:shopsy_app/view/cartpage.dart';

import '../model/logn& signup.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopsy Mart"),
        actions: [
          IconButton(onPressed: () {
            Get.to(()=>CartPage());
          }, icon: Icon(Icons.shopping_cart_checkout,color: Colors.red,))
        ],
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

                controller.productName = productDetail["name"];
                controller.productImage = productDetail["image"];
                controller.productDescription = productDetail["description"];
                controller.productPrice = productDetail["price"];
                return Card(
                  child: ListTile(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection("product")
                          .doc(productDetail.id)
                          .delete();
                    },
                    leading: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: CircleAvatar(
                      radius: 30,
                      child: Image.memory(base64Decode(productDetail["image"]),fit: BoxFit.fitWidth),
                  ),
                    ),
                    title: Text(productDetail["name"]),
                    subtitle: Text(productDetail["description"]),
                    trailing: CircleAvatar(
                      child: IconButton(
                        onPressed: () async {
                          print(controller.productDescription);
                          await DBHelper().insertProduct(Product(
                              description:
                              productDetail["description"],
                              price: productDetail["price"],
                              name: productDetail["name"],
                              image: productDetail["image"]));
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       title:
                          //           Text("Are you want to Added this cart ???"),
                          //       actions: [
                          //         TextButton(
                          //             onPressed: () {
                          //               Get.back();
                          //             },
                          //             child: Text("No")),
                          //         TextButton(
                          //             onPressed: () async {
                          //               await DBHelper().insertProduct(Product(
                          //                   description:
                          //                       productDetail["description"],
                          //                   price: productDetail["price"],
                          //                   name: productDetail["name"],
                          //                   image: productDetail["image"]));
                          //
                          //             },
                          //             child: Text("yes"))
                          //       ],
                          //     );
                          //   },
                          // );
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
                          controller.pickImage(false);
                        },
                        child: Stack(
                          children: [
                            Obx(
                              () => CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(controller.filepath.value),
                                ),
                                child: (controller.filepath.value.isEmpty)
                                    ? IconButton(
                                        onPressed: () {
                                          controller.pickImage(true);
                                        },
                                        icon: Icon(Icons.camera_alt_outlined))
                                    : SizedBox.shrink(),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    controller.pickImage(false);
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
                              return "* Plz Enter Product Description";
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
                        if (controller.filepath.isNotEmpty) {
                          var file = File(controller.filepath.value);
                          var readAsBytes = await file.readAsBytes();
                          controller.image = base64Encode(readAsBytes);
                        }

                        await FirebaseFirestore.instance
                            .collection("product")
                            .doc(DateTime.now().toString())
                            .set(Product(
                              name: name.text,
                              price: price.text,
                              description: description.text,
                              image: controller.image,
                            ).toJson());
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
