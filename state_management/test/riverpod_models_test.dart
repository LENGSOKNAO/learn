import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/riverpod/models/product.dart';

void main() {
  group('Product model', () {
    final testJson = {
      'id': 1,
      'title': 'Test Product',
      'price': 19.99,
      'description': 'A test product',
      'category': 'electronics',
      'image': 'https://example.com/image.png',
      'rating': {'rate': 4.5, 'count': 100},
    };

    test('fromJson parses correctly', () {
      final product = Product.fromJson(testJson);
      expect(product.id, 1);
      expect(product.title, 'Test Product');
      expect(product.price, 19.99);
      expect(product.description, 'A test product');
      expect(product.category, 'electronics');
      expect(product.image, 'https://example.com/image.png');
      expect(product.rating.rate, 4.5);
      expect(product.rating.count, 100);
    });

    test('fromJson handles int price', () {
      final json = {...testJson, 'price': 20};
      final product = Product.fromJson(json);
      expect(product.price, 20.0);
    });
  });
}
