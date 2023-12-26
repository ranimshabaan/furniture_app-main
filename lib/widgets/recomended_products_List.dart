import 'package:flutter/material.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/widgets/products_card.dart';

class RecmmondedList extends StatelessWidget {
  const RecmmondedList({
    super.key,
    required this.products,
    
  });
  final List<ProductsModel> products;
 

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.693,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductsCard(
          product: products[index],
        );
      },
    );
  }
}
