class CartItemModel {
  final String id;
  final String fitText;
  final double price;
  final String imagePath;
  final int quantity;

  const CartItemModel({
    required this.id,
    required this.fitText,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  CartItemModel copyWith({
    String? id,
    String? fitText,
    double? price,
    String? imagePath,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      fitText: fitText ?? this.fitText,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
    );
  }
}
