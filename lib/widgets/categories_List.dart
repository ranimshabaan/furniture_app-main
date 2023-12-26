import 'package:flutter/material.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/widgets/Category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
  });

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(
                category: categories[index]
                
                );
                
          }),
    );
  }
}
