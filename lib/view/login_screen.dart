import 'package:demo_app_provider/res/component/button.dart';
import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/utils/utils.dart';
import 'package:demo_app_provider/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obcurtext = ValueNotifier(false);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obcurtext.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                focusNode: email,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, email, pass);
                },
              ),
              SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: _obcurtext,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obcurtext.value,
                    focusNode: pass,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)),
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.password_sharp,
                        color: Colors.black,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obcurtext.value = !_obcurtext.value;
                        },
                        child: _obcurtext.value
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              RoundButton(
                title: "LOGIN",
                loading: authViewModel.loading,
                onTap: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Please enter password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        "Password must be 6 digits", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString()
                    };
                    authViewModel.loginApi(data, context);
                    print("Api");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
