// lib/features/cart_screen/cubit/cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart_screen/models/cart_item_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static const double vatRate = 0.5; // غيّرها لو هتفعّل ضريبة فعليًا
  static const double shippingFee = 20;

  final List<CartItemModel> _items = [];

  void loadCart(List<CartItemModel> initialItems) {
    _items
      ..clear()
      ..addAll(initialItems);
    _emitLoaded();
  }

  void addItem(CartItemModel item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }
    _emitLoaded();
  }

  void removeItem(String id) {
    _items.removeWhere((e) => e.id == id);
    _emitLoaded();
  }

  void increaseQuantity(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;
    _items[index] = _items[index].copyWith(
      quantity: _items[index].quantity + 1,
    );
    _emitLoaded();
  }

  void decreaseQuantity(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final currentQty = _items[index].quantity;
    if (currentQty <= 1) {
      removeItem(id);
      return;
    }
    _items[index] = _items[index].copyWith(quantity: currentQty - 1);
    _emitLoaded();
  }

  void _emitLoaded() {
    final subtotal = _items.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );
    final vat = subtotal * vatRate;
    final total = subtotal + vat + (_items.isEmpty ? 0 : shippingFee);

    emit(
      CartLoaded(
        items: List.unmodifiable(_items),
        subtotal: subtotal,
        vat: vat,
        shippingFee: _items.isEmpty ? 0 : shippingFee,
        total: total,
      ),
    );
  }
}
