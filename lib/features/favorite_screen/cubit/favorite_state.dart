// lib/features/cart_screen/cubit/cart_state.dart

import 'package:ecommerce_app/features/favorite_screen/models/favorit_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce_app/features/cart_screen/models/cart_item_model.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteCartInitial extends FavoriteState {}



class FavoriteCartLoaded extends FavoriteState {
  final List<FavoritItemModel> items;
  final double subtotal;
  final double vat;
  final double shippingFee;
  final double total;

  const FavoriteCartLoaded({
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
