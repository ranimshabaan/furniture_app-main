import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit_states.dart';
import 'package:furniture_app/details/details_desc.dart';
import 'package:furniture_app/details/details_info.dart';
import 'package:furniture_app/helper/show_snack.dart';
import 'package:furniture_app/models/products.dart';


class Body extends StatelessWidget {
  final ProductsModel product;

  const Body({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {
        if (state is AddProductfauilre) {
          print('Error ${state.errMessage}');
        }
        if (state is AddProductSuceessed) {
          // removed --> uncorrect place BlocProvider.of<AddProductsCubit>(context).AddProducts(product);
      
        }
      },
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DetailsInfo(product: product),
            Positioned(
              left: 150,
              right: -12,
              top: 180,
              child: Image.network(
                product.image,
                width: 350,
                height: 250,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 400,
              child: DetailsDesc(product: product),
            ),
          ],
        );
      },
    );
  }
}
