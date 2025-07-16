import 'package:devtools_example/componens/my_button.dart';
import 'package:devtools_example/componens/my_textfield.dart';
import 'package:devtools_example/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  //text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() {
    /*
      fill out aoutomatication here..

    */

    //navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: screenWidth < 600 ? screenWidth : 400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Logo
                    Icon(
                      Icons.lock_open_rounded,
                      size: 100,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    //Message, app Slogan
                    Text("FOOD DELIVERY APP",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),
                    const SizedBox(
                      height: 25,
                    ),

                    //email textField
                    MyTextfield(
                      controller: emailController,
                      hintText: "email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),

                    //pass textField
                    MyTextfield(
                      controller: passwordController,
                      hintText: "password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),

                    //sign in button
                    MyButton(
                      text: "Sign in",
                      onTap: login,
                    ),
                    const SizedBox(height: 25),

                    // not a member ? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Resgiter now",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
