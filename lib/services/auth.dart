import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get autenticated => _isLoggedIn;

  void login({required Map creds}) {
    print(creds);
    _isLoggedIn = true;

    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
