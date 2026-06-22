class Product {
  final int id;
  final String name;
  final String photographer;
  final String imageLink;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.photographer,
    required this.imageLink,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['alt'] ?? 'Beauty Photo',
      photographer: json['photographer'] ?? '',
      imageLink: json['src']?['large'] ?? '',
      description: json['alt'] ?? 'No description available.',
    );
  }
}