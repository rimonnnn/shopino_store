// lib/features/cart_screen/cubit/cart_cubit.dart

import 'package:ecommerce_app/features/cart_screen/cart_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart_screen/models/cart_item_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._localDataSource) : super(CartInitial());

  final CartLocalDataSource _localDataSource;

  static const double vatRate = 0.5; // غيّرها لو هتفعّل ضريبة فعليًا
  static const double shippingFee = 20;

  final List<CartItemModel> _items = [];

  /// تتنادى مرة واحدة عند بدء التطبيق عشان تحمّل الكارت المحفوظ
  Future<void> loadCart() async {
    final saved = await _localDataSource.getCart();
    _items
      ..clear()
      ..addAll(saved);
    _emitLoaded();
  }

  Future<void> addItem(CartItemModel item) async {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }
    await _localDataSource.saveCart(_items);
    _emitLoaded();
  }

  Future<void> removeItem(String id) async {
    _items.removeWhere((e) => e.id == id);
    await _localDataSource.saveCart(_items);
    _emitLoaded();
  }

  Future<void> increaseQuantity(String id) async {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;
    _items[index] = _items[index].copyWith(
      quantity: _items[index].quantity + 1,
    );
    await _localDataSource.saveCart(_items);
    _emitLoaded();
  }

  Future<void> decreaseQuantity(String id) async {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final currentQty = _items[index].quantity;
    if (currentQty <= 1) {
      await removeItem(id);
      return;
    }
    _items[index] = _items[index].copyWith(quantity: currentQty - 1);
    await _localDataSource.saveCart(_items);
    _emitLoaded();
  }

  /// تتنادى عند الـ logout
  Future<void> clearCart() async {
    _items.clear();
    await _localDataSource.clearCart();
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
