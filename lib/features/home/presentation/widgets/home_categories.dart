import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/home_category_chip.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    super.key,
  });

  final List<Category> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: categories.length,
        separatorBuilder: (context, index) => 8.horizSpacing,
        itemBuilder: (context, index) {
          final category = categories[index];

          return HomeCategoryChip(
            label: category.name,
            icon: category.icon,
            isRounded: true,
            isSelected: selectedCategory == category.name,
            onTap: () => onCategorySelected(category.name),
          );
        },
      ),
    );
  }
}
