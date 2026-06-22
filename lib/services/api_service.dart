import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'api_keys.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final url = Uri.parse(
      'https://api.pexels.com/v1/search?query=beauty makeup skincare&per_page=30',
    );

    final response = await http.get(
      url,
      headers: {
        'Authorization': pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List photos = body['photos'];

      return photos.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load beauty photos');
    }
  }
}