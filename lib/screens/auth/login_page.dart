import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/screens/auth/forgotPassword.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/user_service.dart';
import 'package:the_perfect_home_zm/widgets/my_buttom.dart';
import 'package:the_perfect_home_zm/widgets/my_textfield.dart';
import 'package:the_perfect_home_zm/widgets/square_tile.dart';
import 'package:the_perfect_home_zm/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 50),
                //welcome back you been missed

                const Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    color: secondary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 25),

                //username
                MyTextField(
                  controller: emailController,
                  hintText: 'Username or email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                //forgot password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            color: primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                //sign in button
                MyButton(
                  onTap: () => signUserIn(context, emailController, passwordController),
                  text: 'Sign In',
                ),

                const SizedBox(
                  height: 10,
                ),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //google + apple button

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'assets/icons/google.svg',
                      height: 60,
                    ),

                    const SizedBox(width: 20),
                    // apple button
                    SquareTile(
                      onTap: () {},
                      imagePath: 'assets/icons/apple.svg',
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                // not a member ? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(color: secondary, fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
