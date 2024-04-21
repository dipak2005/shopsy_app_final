// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
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
        leading: Icon(
          Icons.local_mall_outlined,
          size: 30,
          color: Colors.red,
        ),
        title: Text(
          "Shopsy Mart",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CartPage());
              },
              icon: Icon(
                Icons.shopping_cart_checkout,
                color: Colors.red,
              ))
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
                return Hero(
                  tag: index,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      surfaceTintColor: Colors.red,
                      child: ListTile(
                        onLongPress: () {
                          FirebaseFirestore.instance
                              .collection("product")
                              .doc(productDetail.id)
                              .delete();
                        },
                        leading: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: MemoryImage(
                              base64Decode(productDetail["image"]),
                            ),
                          ),
                        ),
                        title: Text(
                          productDetail["name"],
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          productDetail["description"],
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.red.shade200,
                          child: IconButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Are you want to Added this cart ???",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "No",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            await DBHelper().insertProduct(
                                                Product(
                                                    description: productDetail[
                                                        "description"],
                                                    price:
                                                        productDetail["price"],
                                                    name: productDetail["name"],
                                                    image: productDetail[
                                                        "image"]));
                                            Get.showSnackbar(GetSnackBar(
                                              backgroundColor: Colors.green,
                                              title: "Add successfully",
                                              duration: Duration(microseconds: 200),
                                              snackStyle: SnackStyle.GROUNDED,
                                            ));

                                            Get.to(()=>CartPage());

                                          },
                                          child: Text(
                                            "yes",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red),
                                          ))
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.add_shopping_cart,
                                color: Colors.white),
                          ),
                        ),
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
          backgroundColor: Colors.red,
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Add Product",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w700),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.pickImage(false);
                        },
                        child: Column(
                          children: [
                            Obx(
                              () => CircleAvatar(
                                backgroundColor: Colors.red.shade100,
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(controller.filepath.value),
                                ),
                                child: (controller.filepath.value.isEmpty)
                                    ? IconButton(
                                        onPressed: () {
                                          controller.pickImage(true);
                                        },
                                        icon: Icon(Icons.camera_alt_outlined,
                                            color: Colors.red))
                                    : SizedBox.shrink(),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.pickImage(false);
                                },
                                child: Text(
                                  "Gallery",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                borderSide: BorderSide(color: Colors.red)),
                            suffixIcon: Icon(Icons.edit, color: Colors.red),
                            hintStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                borderSide: BorderSide(color: Colors.red)),
                            suffixIcon: Icon(Icons.edit, color: Colors.red),
                            hintStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                borderSide: BorderSide(color: Colors.red)),
                            suffixIcon: Icon(Icons.edit, color: Colors.red),
                            hintStyle: TextStyle(color: Colors.red),
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
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
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
                        Get.showSnackbar(GetSnackBar(
                          backgroundColor: Colors.green,
                          title: "Add successfully",
                          duration: Duration(microseconds: 200),
                          snackStyle: SnackStyle.GROUNDED,
                        ));

                        controller.filepath.value = "";
                        name.clear();
                        price.clear();
                        description.clear();
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          )),
    );
  }
}
