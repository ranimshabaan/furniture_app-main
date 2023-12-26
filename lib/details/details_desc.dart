import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit_states.dart';
import 'package:furniture_app/cart/cart_page.dart';
import 'package:furniture_app/helper/show_snack.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/widgets/Add_to_cart_Button.dart';

class DetailsDesc extends StatefulWidget {
  final ProductsModel product;

  const DetailsDesc({super.key, required this.product});

  @override
  State<DetailsDesc> createState() => _DetailsDescState();
}

class _DetailsDescState extends State<DetailsDesc> {
  String? title, subtitle, id, desc, image, category;
  int? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16, bottom: 5),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.product.subtitle,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.product.desc,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
           SizedBox(
            height: 90,
          ),
          BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              return AddProductButton(
                text: 'Add To Cart',
                isLoading: state is AddProductLoaded ? true : false,
                onTap: () {
                  BlocProvider.of<ProductsCubit>(context)
                      .AddProducts(widget.product);
                  Navigator.pushNamed(context, CartPage.id);
                  ShowSnackBar(context, 'Product has been added');
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
