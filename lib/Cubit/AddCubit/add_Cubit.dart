import 'package:bloc/bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit_states.dart';
import 'package:furniture_app/models/products.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(AddProductIntial());

  List<ProductsModel> Products = [];

  AddProducts(ProductsModel product) {
    try {
      Products.add(product);
      emit(AddProductSuceessed());
    } catch (e) {
      emit(AddProductfauilre(e.toString()));
    }
  }

  RemoveProducts(ProductsModel product) async {
    Products.remove(product);
   emit(RemoveProductSuceessed(Products.toList()));
  }

}
