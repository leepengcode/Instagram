import 'package:demo_app_provider/Provider/login_provider.dart';
import 'package:demo_app_provider/Screen/DarkMode/darkmode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _toggle = ValueNotifier(false);
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for email validation
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(hintText: "Email"),
                  validator: _validateEmail,
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable: _toggle,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _password,
                      obscureText: _toggle.value,
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                _toggle.value = !_toggle.value;
                              },
                              child: Icon(_toggle.value
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      validator: _validatePassword,
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool success = await provider.login(
                          _email.text.toString(),
                          _password.text.toString(),
                        );
                        if (success) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ThemeScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login failed")),
                          );
                        }
                      }
                    },
                    child: Center(
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: provider.isLoading
                              ? Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ))),
                    ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
