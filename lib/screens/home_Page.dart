import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/cart/cart_page.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/screens/review.dart';
import 'package:furniture_app/services/get_Products.dart';
import 'package:furniture_app/services/get_categories.dart';
import 'package:furniture_app/widgets/categories_List.dart';
import 'package:furniture_app/widgets/recomended_products_List.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
                size: 25,
              ),
            ),
           IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ReviewPage.id);
              },
              icon: const Icon(Icons.feedback_sharp,color: Colors.black,
                
              ),
            ),
          ],
        ),
       
       /* drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: Text(
                        'About me',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
            ),*/
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Browese by Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List<CategoriesModel>>(
                      future: GetCategories().getGategories(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<CategoriesModel> categories = snapshot.data!;
                          return CategoriesList(categories: categories);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Center(
                              child: Image.asset('assets/spinner.gif'));
                        }
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Recommands For You',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: GetProducts().getProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ProductsModel> products = snapshot.data!;
                          return RecmmondedList(products: products);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Center(
                              child: Image.asset('assets/ripple.gif'));
                        }
                      })
                        
                ],
              ),
            ),
          ),
        ));
  }
}
