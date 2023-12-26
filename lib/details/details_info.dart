import 'package:flutter/material.dart';
import 'package:furniture_app/models/products.dart';

import '../cart/cart_page.dart';

class DetailsInfo extends StatelessWidget {
  final ProductsModel product;

  const DetailsInfo({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 232, 230, 230).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(10, 10),
            spreadRadius: 0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CartPage();
          }));
        },
        child: Card(
          elevation: 1,
          color: const Color.fromARGB(255, 232, 230, 230),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  product.category.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: -0.8,
                    height: 1.4,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'price',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  r'$' '${product.price.toString()}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
