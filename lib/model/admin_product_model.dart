class AdminProductModel {
  final String? name;
  final String? description;
  final double? price;
  final int? quantity;
  final String? category;
  List<String>? images;
  final String? id;

  AdminProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    this.images,
    this.id,
  });

  factory AdminProductModel.fromMap(Map<String, dynamic> map) {
    return AdminProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      category: map['category'] != null ? map['category'] as String : null,
      images: List<String>.from((map['images'] as List<String>)),
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      '_id': id,
    };
  }
}
