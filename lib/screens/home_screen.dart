import 'package:flutter/material.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'image': 'assets/images/product4.jpg',
      'name': 'Fenty Gloss Set',
      'price': '\$32',
      'description':
          'A shiny lip gloss collection with soft colors and long-lasting glow.',
    },
    {
      'image': 'assets/images/product3.jpg',
      'name': 'Glow Recipe Toner',
      'price': '\$28',
      'description':
          'Hydrating toner that refreshes the skin and gives a natural glow.',
    },
    {
      'image': 'assets/images/product2.jpg',
      'name': 'Hourglass Concealer',
      'price': '\$36',
      'description':
          'Smooth full-coverage concealer for a flawless makeup look.',
    },
    {
      'image': 'assets/images/product1.jpg',
      'name': 'Huda Beauty Set',
      'price': '\$40',
      'description':
          'Luxury lip and cheek collection with soft pink beauty essentials.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF1F5),

      appBar: AppBar(
        backgroundColor: const Color(0xffFFF1F5),
        elevation: 0,

        title: const Text(
          'Glowify',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.builder(
          itemCount: products.length,

          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),

          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(
                      image: product['image']!,
                      name: product['name']!,
                      price: product['price']!,
                      description: product['description']!,
                    ),
                  ),
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),

                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            product['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            product['price']!,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.pink.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}