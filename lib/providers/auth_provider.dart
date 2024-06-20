
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider  extends ChangeNotifier{
  AuthProvider(){
    checkSign();
  }


  void checkSign() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSignedIn = prefs.getBool("is_signedin") ?? false;
    nofityListeners();
  }
}
