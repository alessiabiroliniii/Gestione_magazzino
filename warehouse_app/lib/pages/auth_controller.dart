import 'package:flutter/material.dart';
import 'package:warehouse_app/pages/login.dart';
import 'package:warehouse_app/pages/register.dart';

class AuthenticationController extends StatefulWidget {
  const AuthenticationController({Key? key}) : super(key: key);

  @override
  State<AuthenticationController> createState() =>
      _AuthenticationControllerState();
}

class _AuthenticationControllerState extends State<AuthenticationController> {
  bool isLoginPage = true;

  void switchPage() {
    if (mounted) setState(() => isLoginPage = !isLoginPage);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginPage) {
      return LoginPage(switchPage: switchPage);
    }

    return RegisterPage(switchPage: switchPage);
  }
}
