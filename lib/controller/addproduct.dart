// To parse this JSON data, do
//
//     final addUser = addUserFromJson(jsonString);

import 'dart:convert';

AddProduct addUserFromJson(String str) => AddProduct.fromJson(json.decode(str));

String addUserToJson(AddProduct data) => json.encode(data.toJson());

class AddProduct {
  String? name;
  String? email;
  String? phone;

  String? image;


  AddProduct(
      {this.name,
        this.email,
        this.phone,

        this.image,

        });

  factory AddProduct.fromJson(Map<String, dynamic> json) => AddProduct(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],

    image: json["image"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,


    "image": image,

  };
}
