import 'package:flutter/material.dart';
import 'package:furniture_app/details/body.dart';
import 'package:furniture_app/models/products.dart';

class DetailsScreen extends StatelessWidget {
  static String id = 'detailsPage';
  final ProductsModel? product;

  const DetailsScreen({super.key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.7,
        backgroundColor: const Color.fromARGB(255, 232, 230, 230),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: product != null
          ? Body(
              product: product!,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
