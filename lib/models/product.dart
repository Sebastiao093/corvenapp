import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.stock,
    
  });

  int id;
  String image;
  String title;
  int price;
  bool stock;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        price: json["price"],
        stock: json["stock"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "price": price,
        "stock": stock,
      };
}
