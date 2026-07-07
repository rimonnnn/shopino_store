// lib/features/cart_screen/cubit/cart_state.dart

import 'package:equatable/equatable.dart';
import 'package:ecommerce_app/features/cart_screen/models/cart_item_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  final double subtotal;
  final double vat;
  final double shippingFee;
  final double total;

  const CartLoaded({
    required this.items,
    required this.subtotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  bool get isEmpty => items.isEmpty;

  @override
  List<Object?> get props => [items, subtotal, vat, shippingFee, total];
}
