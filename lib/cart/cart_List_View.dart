import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit_states.dart';
import 'package:furniture_app/cart/cart_Item.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/screens/home_Page.dart';
import 'package:furniture_app/widgets/Add_to_cart_Button.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    List<ProductsModel> models =
        BlocProvider.of<ProductsCubit>(context).Products;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (context, state) {
          if (state is RemoveProductfauilre) {
            print("Error ${state.errorMessage}");
          }
          if (state is RemoveProductSuceessed) {
            setState(() {});
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              children: [
                Expanded(
                  child: models.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Products',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Your Cart is empty',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: models.length,
                          itemBuilder: (context, index) {
                            return CartItem(
                              productModel: models[index],
                            );
                          }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AddProductButton(
                    text: 'Browse Categories',
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
