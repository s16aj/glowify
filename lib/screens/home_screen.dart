import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppTheme.background(isDark),
      appBar: AppBar(
        backgroundColor: AppTheme.background(isDark),
        elevation: 0,
        title: Text(
          'app_name'.tr(),
          style: AppTheme.titleStyle(fontSize: 36, letterSpacing: 1.5),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            icon: Icon(
              Icons.favorite_border,
              color: AppTheme.textColor(isDark),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load products'));
          }

          final products = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index], isDark: isDark);
              },
            ),
          );
        },
      ),
    );
  }
}
