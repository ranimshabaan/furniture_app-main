import 'package:flutter/material.dart';
import 'package:furniture_app/models/categories.dart';


class CategoryCard extends StatelessWidget {
  final CategoriesModel category;
  const CategoryCard({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 15),
      child: GestureDetector(
        onTap: () { },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 200,
              height: 170,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 40,
                    offset: const Offset(10, 10),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 232, 230, 230),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          category.title,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${category.numOfProducts} producuts',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: -75,
              child: Image.network(
                category.image,
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
