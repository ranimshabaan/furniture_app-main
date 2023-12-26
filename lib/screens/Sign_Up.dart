import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/helper/show_snack.dart';
import 'package:furniture_app/screens/home_Page.dart';
import 'package:furniture_app/widgets/Button.dart';
import 'package:furniture_app/widgets/Custom_Container.dart';
import 'package:furniture_app/widgets/Text.dart';
import 'package:furniture_app/widgets/Text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  static String id = 'SignUpPage';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  String? name, email, password, phone;
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
              child: ListView(
                children: [
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
                    'Create An Account',
                    bold: FontWeight.bold,
                    fontSize: 28,
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomText(
                    'Name',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextWidget(
                    onChanged: (data) {
                      name = data;
                    },
                    icon: Icons.person,
                    text: 'Enter User Name',
                    color: KprimaryColor,
                    obscuretext: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    'Email Address',
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
                  const CustomText(
                    'Phone',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextWidget(
                    onChanged: (data) {
                      phone = data;
                    },
                    icon: Icons.phone,
                    text: 'Enter Phone',
                    color: KprimaryColor,
                    obscuretext: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'SIGN UP',
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {
                          controller!.clear();
                        });

                        try {
                          await SignUpUser();
                          Navigator.pushNamed(context, HomePage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackBar(context, 'Weak Password');
                          } else if (e.code == 'email-already-in-use') {
                            ShowSnackBar(context, 'The account already exists');
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      } else {
                        ShowSnackBar(context, 'there is was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'have an account already?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const CustomText(
                            'Log in',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SignUpUser() async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
