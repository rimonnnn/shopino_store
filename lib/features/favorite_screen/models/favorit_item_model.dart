// lib/features/favorite_screen/models/favorit_item_model.dart

class FavoritItemModel {
  final String id;
  final String fitText;
  final double price;
  final String imagePath;
  final int quantity;

  const FavoritItemModel({
    required this.id,
    required this.fitText,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  FavoritItemModel copyWith({
    String? id,
    String? fitText,
    double? price,
    String? imagePath,
    int? quantity,
  }) {
    return FavoritItemModel(
      id: id ?? this.id,
      fitText: fitText ?? this.fitText,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fitText': fitText,
      'price': price,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }

  factory FavoritItemModel.fromJson(Map<String, dynamic> json) {
    return FavoritItemModel(
      id: json['id'] as String,
      fitText: json['fitText'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      quantity: json['quantity'] as int? ?? 1,
    );
  }
}
