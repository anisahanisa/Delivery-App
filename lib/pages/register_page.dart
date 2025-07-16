import 'package:devtools_example/componens/my_button.dart';
import 'package:devtools_example/componens/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
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
                    Text("Let's create an account for you",
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
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),

                    // confirm pass textField
                    MyTextfield(
                      controller: confirmpasswordController,
                      hintText: "Confirm password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),

                    //sign up button
                    MyButton(
                      text: "Sign Up",
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),

                    // already have an account? login here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already have an account?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login now",
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
