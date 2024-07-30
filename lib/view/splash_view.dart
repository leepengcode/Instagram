import 'package:demo_app_provider/view_model/services/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Splash Screen",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ));
  }
}
