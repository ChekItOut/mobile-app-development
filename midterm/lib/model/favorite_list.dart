import 'package:flutter/material.dart';

class FavoriteList extends ChangeNotifier {
  FavoriteList();

  final Set<int> _favoriteHotelIds = <int>{};

  bool isFavorite(int hotelId) => _favoriteHotelIds.contains(hotelId);

  List<int> get hotelIds => _favoriteHotelIds.toList(growable: false);

  void toggle(int hotelId) {
    if (!_favoriteHotelIds.add(hotelId)) {
      _favoriteHotelIds.remove(hotelId);
    }
    notifyListeners();
  }
}

class FavoriteListScope extends InheritedNotifier<FavoriteList> {
  const FavoriteListScope({
    Key? key,
    required FavoriteList favoriteList,
    required Widget child,
  }) : super(
          key: key,
          notifier: favoriteList,
          child: child,
        );

  static FavoriteList of(BuildContext context) {
    final FavoriteListScope? scope =
        context.dependOnInheritedWidgetOfExactType<FavoriteListScope>();
    assert(scope != null, 'FavoriteListScope not found in widget tree.');
    return scope!.notifier!;
  }
}
