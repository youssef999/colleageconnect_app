import 'package:collegeconnect/screens/Forgot_Password.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'landing_page.dart';
import 'package:flutter/material.dart';
import 'package:collegeconnect/utilities/constants.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController email=TextEditingController();
    TextEditingController pass=TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(

          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: kApplication_Title_Style,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Example@iau.edu.sa'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: pass,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: '•••••••••••••••••••••'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 2.0,
                            ),
                            GestureDetector(
                              onTap: () {

                                Get.to(const ForgotPassword());

                                },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color(0xFF199D8C),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            width: 235,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF9DDAC),
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  fontSize: 17
                                ),
                              ),
                            ),
                          ),
                          onTap:()async {
                            try {
                              await _auth
                                  .signInWithEmailAndPassword(email: email.text, password: pass.text)
                                  .then((value) async {
                                Get.snackbar("DONE","Login Succesfully",
                                    colorText: Colors.black, snackPosition: SnackPosition.TOP);
                                     print("Done Login");
                                     Get.to(const HomeScreen());
                              });


                            } catch (e) {
                              Get.snackbar("Error login Acoount", e.toString(),
                                  colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Do not have an account? ",
                    style: TextStyle(
                      color: Color(0xFF199D8C),
                    ),
                  ),
                  Text(
                    "Create new account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF199D8C),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }


}
