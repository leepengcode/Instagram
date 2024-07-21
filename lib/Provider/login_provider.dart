import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    setLoading(true);
    try {
      Response res =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      setLoading(false);
      if (res.statusCode == 200) {
        print("Login Suceesfully");
        return true;
      } else {
        print("Login False");
        return false;
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
      return false;
    }
  }

  // void login(String email, String password) async {
  //   setLoading(true);
  //   try {
  //     Response res =
  //         await post(Uri.parse('https://reqres.in/api/login'), body: {
  //       'email': email,
  //       'password': password,
  //     });
  //     if (res.statusCode == 200) {
  //       setLoading(false);
  //       print("Login Successfully");
  //     } else {
  //       setLoading(false);
  //       print("Login failure");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
