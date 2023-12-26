import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Cubit/AddCubit/add_Cubit.dart';
import 'package:furniture_app/cart/cart_page.dart';
import 'package:furniture_app/details/Details_Screen.dart';
import 'package:furniture_app/screens/Sign_Up.dart';
import 'package:furniture_app/screens/Sign_in.dart';
import 'package:furniture_app/screens/home_Page.dart';
import 'package:furniture_app/screens/onborading.dart';
import 'package:furniture_app/screens/review.dart';
import 'package:furniture_app/screens/splash_screen.dart';
import 'package:furniture_app/simple_Observer.dart';
import 'package:furniture_app/screens/onborading.dart';
import 'package:furniture_app/screens/review.dart';


import 'firebase_options.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
   const FurnitureApp(),
  );
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()),
        
      ],
      child: MaterialApp(
        routes: {
          ReviewPage.id :(context) => const ReviewPage(),
          OnboardingView.id: (context) => const OnboardingView(),
          SignUp.id: (context) => const SignUp(),
          HomePage.id: (context) => const HomePage(),
          DetailsScreen.id: (context) => const DetailsScreen(),
          CartPage.id: (context) => const CartPage(),
          SignIn.id :(context) => const SignIn(),
        },
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
