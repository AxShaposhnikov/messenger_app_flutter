import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Login now to see what they are talking',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/logo.png'),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              prefixIcon: const Icon(Icons.mail),
                              hintText: "Mail"),
                          controller: _loginController,
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)
                                ? null
                                : 'Please enter valid email';
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          }),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "Password"),
                        controller: _passwordController,
                        validator: (value) {
                          return value!.length < 6
                              ? null
                              : "Password must be at least 6 characters";
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {},
                            child: const Text('Sign In')),
                      )
                    ],
                  ))),
        ));
  }
}
