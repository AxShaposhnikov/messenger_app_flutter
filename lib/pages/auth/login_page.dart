import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        // указываем для поля границу,
                        // иконку и подсказку (hint)
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Mail"),
                        // не забываем указать TextEditingController
                        controller: _loginController,
                        // параметр validator - функция которая,
                        // должна возвращать null при успешной проверки
                        // или строку при неудачной
                        validator: (value) {
                          // здесь мы для наглядности добавили 2 проверки
                          if (value == null || value.isEmpty) {
                            return "User mail is empty";
                          }
                          if (value.length < 3) {
                            return "Заголовок должен быть не короче 3 символов";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        // указываем для поля границу,
                        // иконку и подсказку (hint)
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password"),
                        // не забываем указать TextEditingController
                        controller: _passwordController,
                        // параметр validator - функция которая,
                        // должна возвращать null при успешной проверки
                        // или строку при неудачной
                        validator: (value) {
                          // здесь мы для наглядности добавили 2 проверки
                          if (value == null || value.isEmpty) {
                            return "Заголовок пустой";
                          }
                          if (value.length < 3) {
                            return "Заголовок должен быть не короче 3 символов";
                          }
                          return null;
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
