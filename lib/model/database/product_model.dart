// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

// Product productFromJson(String str) => Product.fromJson(json.decode(str));
//
// String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String? name;
  String? image;
  String? discription;
  String? price;
  int? id;

  Product({
    this.name,
    this.image,
    this.discription,
    this.price,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    image: json["image"],
    discription: json["discription"],
    price: json["price"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "discription": discription,
    "price": price,
    "id": id,
  };
}