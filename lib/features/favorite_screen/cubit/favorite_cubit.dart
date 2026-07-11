import 'package:ecommerce_app/features/favorite_screen/cubit/favorite_state.dart';
import 'package:ecommerce_app/features/favorite_screen/favorite_local_data_source.dart';
import 'package:ecommerce_app/features/favorite_screen/models/favorit_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._localDataSource) : super(FavoriteCartInitial());

  final FavoriteLocalDataSource _localDataSource;

  final List<FavoritItemModel> _items = [];

  /// تتنادى مرة واحدة عند فتح التطبيق (مثلاً في main.dart) عشان تحمّل الـ favorites المحفوظة
  Future<void> loadFavorites() async {
    final saved = await _localDataSource.getFavorites();
    _items
      ..clear()
      ..addAll(saved);
    _emitLoaded();
  }

  /// يستخدمها زرار القلب في ProductDetailsScreen عشان يعرف يلوّن نفسه
  bool isFavorite(String id) => _items.any((e) => e.id == id);

  /// إضافة/إزالة المنتج (toggle) عند الضغط على زرار الـ favorite
  Future<void> toggleFavorite(FavoritItemModel item) async {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items.removeAt(index);
    } else {
      _items.add(item);
    }
    await _localDataSource.saveFavorites(_items);
    _emitLoaded();
  }

  Future<void> removeItem(String id) async {
    _items.removeWhere((e) => e.id == id);
    await _localDataSource.saveFavorites(_items);
    _emitLoaded();
  }

  /// تتنادى عند الـ logout
  Future<void> clearFavorites() async {
    _items.clear();
    await _localDataSource.clearFavorites();
    _emitLoaded();
  }

  void _emitLoaded() {
    final subtotal = _items.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    emit(
      FavoriteCartLoaded(
        items: List.unmodifiable(_items),
        subtotal: subtotal,
        vat: 0,
        shippingFee: 0,
        total: subtotal,
      ),
    );
  }
}
