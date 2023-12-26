import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit.dart';
import 'package:furniture_app/models/products.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
   const CartItem({
    super.key,
    required this.productModel,
    
   
  });
  final ProductsModel productModel;
 
 
  @override
  Widget build(BuildContext context) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(productModel.date ?? DateTime.now());
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
               Positioned(
              left: 10,
              top: 75,
              child: Image.network(
                productModel.image,
                width: 50,
                height: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      productModel.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    productModel.subtitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      try {
                        BlocProvider.of<ProductsCubit>(context)
                            .RemoveProducts(productModel);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product has been removed'),
                          ),
                        );
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                  formattedDate,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
