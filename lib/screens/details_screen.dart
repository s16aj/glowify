import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  const DetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppTheme.background(isDark),
      appBar: AppBar(
        backgroundColor: AppTheme.background(isDark),
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.textColor(isDark)),
        title: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTheme.titleStyle(fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              image,
              height: 330,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 330,
                  child: Center(
                    child: Icon(Icons.image_not_supported, size: 60),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTheme.titleStyle(
                        fontSize: 30,
                        color: AppTheme.textColor(isDark),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description.isEmpty
                          ? 'No description available.'
                          : description,
                      style: AppTheme.bodyStyle(
                        isDark: isDark,
                        fontSize: 16,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ).copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
