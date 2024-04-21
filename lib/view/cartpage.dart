// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy_app/controller/cartController.dart';
import 'package:shopsy_app/model/product.dart';
import 'package:shopsy_app/view/homepage.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CartPage",
          style: TextStyle(
              color: Colors.red, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(
        () => (controller.proList.isNotEmpty)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: controller.proList.length,
                itemBuilder: (context, index) {
                  Product data = controller.proList[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    surfaceTintColor: Colors.red,
                    child: ListTile(
                      leading: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.red.shade100,
                          radius: 30,
                          backgroundImage: MemoryImage(
                            base64Decode(
                              data.image ?? "",
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        data.name ?? "",
                        style: TextStyle(fontSize: 17),
                      ),
                      subtitle: Text(
                          "${data.description ?? ""}  \$${data.price}",
                          style: TextStyle(fontSize: 16)),
                      trailing: IconButton(
                          onPressed: () {
                            controller.proList.removeAt(index);
                            Get.showSnackbar(GetSnackBar(
                              duration: Duration(microseconds: 100),
                              title: "Remove Successfully",
                              snackStyle: SnackStyle.FLOATING,
                            ));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: Colors.red,
                      size: 170,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your Cart is Empty Now S0ooo....",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: "add_now",
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        onPressed: () {
                          Get.to(() => HomePage());
                        },
                        child: Text(
                          "Add Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        )),
                  )
                ],
              ),
      ),
    );
  }
}
