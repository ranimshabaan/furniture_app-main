import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/helper/show_snack.dart';
import 'package:furniture_app/screens/Sign_Up.dart';
import 'package:furniture_app/screens/home_Page.dart';
import 'package:furniture_app/widgets/Button.dart';
import 'package:furniture_app/widgets/Custom_Container.dart';
import 'package:furniture_app/widgets/Text.dart';
import 'package:furniture_app/widgets/Text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String id = 'SigninPage';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formkey,
              child: ListView(children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                    child: Icon(
                  Icons.chair,
                  color: KprimaryColor,
                  size: 100,
                )),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                    child: CustomText(
                  'Welcome Back',
                  bold: FontWeight.bold,
                  fontSize: 28,
                )),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                    child: CustomText(
                  'Login to contiune',
                  fontSize: 20,
                )),
                const SizedBox(
                  height: 40,
                ),
                const CustomText(
                  'Email',
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  onChanged: (data) {
                    email = data;
                  },
                  icon: Icons.email,
                  text: 'Enter Email Address',
                  color: KprimaryColor,
                  obscuretext: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  'Password',
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  obscuretext: true,
                  onChanged: (data) {
                    password = data;
                  },
                  icon: Icons.lock,
                  text: 'Enter Password',
                  color: KprimaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 215),
                  child: CustomText(
                    'Forget Password?',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: 'Login',
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        controller!.clear();
                      });

                      try {
                        await LoginUser();
                        ShowSnackBar(context, 'Login Has Successful');
                        Navigator.pushNamed(context, HomePage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                          ShowSnackBar(context, 'Invalid Email Or Password');
                        }
                        if (e.code == 'user-not-found') {
                          ShowSnackBar(context, 'User not found');
                        } else if (e.code == 'wrong-password') {
                          ShowSnackBar(context, 'Wrong Password');
                        } else {
                          ShowSnackBar(
                              context, 'An Error has occourd , try again');
                        }
                      } catch (e) {
                        ShowSnackBar(context, e.toString());
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                        icon: FontAwesomeIcons.google,
                        color: Color.fromARGB(255, 6, 59, 103)),
                    CustomContainer(
                      icon: FontAwesomeIcons.facebook,
                      color: Color.fromARGB(255, 6, 57, 100),
                    ),
                    CustomContainer(
                      icon: FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                    CustomContainer(
                      icon: FontAwesomeIcons.github,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUp.id);
                        },
                        child: const CustomText(
                          'Sign Up now',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
