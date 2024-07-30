import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/view_model/auth_view_model.dart';
import 'package:demo_app_provider/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Center(
              child: GestureDetector(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Text(
              "LOG OUT",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ))),
    );
  }
}
