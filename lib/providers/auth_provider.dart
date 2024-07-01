import 'package:flutter/material.dart';
import 'package:lodging_app/models/auth_model.dart';
import 'package:lodging_app/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  Map _userAuth = AuthModel.userAuth;
  final List _dataUsers = UserModel.dataUsers;

  Map get userAuth => _userAuth;

  bool login(String email, String password) {
    var checkDataLogin = _dataUsers.where(
      (element) => element['email'] == email && element['password'] == password,
    );

    if (checkDataLogin.isNotEmpty) {
      _userAuth = checkDataLogin.first;
      return true;
    } else {
      return false;
    }
  }

  bool register(String username, String email, String password, String gender) {
    var checkDataRegister = _dataUsers.where(
      (element) => element['email'] == email && element['password'] == password,
    );
    if (checkDataRegister.isEmpty) {
      var data = {
        "username": username,
        "password": password,
        "user_pict": "",
        "email": email,
        "no_phone": "",
        "address": "",
        "gender": gender,
      };

      _dataUsers.insert(0, data);
      _userAuth = data;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
