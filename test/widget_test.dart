import 'package:flutter_test/flutter_test.dart';

import 'package:glowify/models/product.dart';
import 'package:glowify/providers/favorites_provider.dart';

void main() {
  test('FavoritesProvider toggles a product in and out of favorites', () {
    final product = Product(
      id: 1,
      name: 'Glow Serum',
      photographer: 'Tester',
      imageLink: 'https://example.com/glow.jpg',
      description: 'A test product description.',
    );

    final favorites = FavoritesProvider();

    expect(favorites.favorites, isEmpty);
    expect(favorites.isFavorite(product), isFalse);

    favorites.toggleFavorite(product);
    expect(favorites.favorites.length, 1);
    expect(favorites.isFavorite(product), isTrue);

    favorites.toggleFavorite(product);
    expect(favorites.favorites, isEmpty);
    expect(favorites.isFavorite(product), isFalse);
  });
}
