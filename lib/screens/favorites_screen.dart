import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet ❤️',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(product.imageLink),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.photographer),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      context
                          .read<FavoritesProvider>()
                          .toggleFavorite(product);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          image: product.imageLink,
                          name: product.name,
                          description: product.description,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}