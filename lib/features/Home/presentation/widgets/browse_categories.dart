import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/categories.dart';
import 'package:movies_app/features/Home/presentation/widgets/category_item.dart';

class CategoriesRow extends StatelessWidget {
  final String selected;
  final Function(String) onTap;

  const CategoriesRow({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];

          return CategoryItem(
            title: category,
            isSelected: selected == category,
            onTap: () => onTap(category),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: categories.length,
      ),
    );
  }
}