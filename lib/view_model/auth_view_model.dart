import 'dart:collection';
import 'dart:math';

import 'package:demo_app_provider/model/user_model.dart';
import 'package:demo_app_provider/respsitory/AuthRepository.dart';
import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/utils/utils.dart';
import 'package:demo_app_provider/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = Authrepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUploading = false;
  bool get sigUploading => _signUploading;

  setSignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Utils.flushBarSuccessMessage("Login Succesfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> sigUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.sigUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarSuccessMessage("SignUp Succesfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
