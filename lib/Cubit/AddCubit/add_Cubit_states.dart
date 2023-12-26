import 'package:furniture_app/models/products.dart';

class ProductsStates {}

class AddProductIntial extends ProductsStates {}

class AddProductLoaded extends ProductsStates {}

class AddProductSuceessed extends ProductsStates {}

class AddProductfauilre extends ProductsStates {
  final String errMessage;
  AddProductfauilre(this.errMessage);
}

class RemoveProductSuceessed extends ProductsStates {
  final List<ProductsModel> updateProducts;

  RemoveProductSuceessed(this.updateProducts);
}

class RemoveProductfauilre extends ProductsStates {
  final String errorMessage;
  RemoveProductfauilre(this.errorMessage);
}

