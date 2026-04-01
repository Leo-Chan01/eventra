class Category {
  const Category({
    required this.name,
    required this.icon,
  });

  final String name;
  final String icon;
}

class Vendor {
  const Vendor({
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewsCount,
    required this.image,
    this.isFavorite = false,
  });

  final String name;
  final String category;
  final double rating;
  final int reviewsCount;
  final String image;
  final bool isFavorite;
}
