import 'package:flutter/material.dart';
import 'package:furniture_app/models/products.dart';

import '../details/Details_Screen.dart';

class ProductsCard extends StatelessWidget {
  final ProductsModel product;


  const ProductsCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                  product: ProductsModel(
                      id: product.id,
                      title: product.title,
                      image: product.image,
                      price: product.price,
                      category: product.category,
                      subtitle: product.subtitle,
                      desc: product.desc)),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
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
                          product.title,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          r'$' '${product.price.toString()}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Image.network(
                product.image,
                width: 300,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
