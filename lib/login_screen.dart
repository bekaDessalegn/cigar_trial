import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final appAuth = FlutterAppAuth();
  final _cliendId = '845d5616-d846-4c09-995e-9ba51f9df45d';
  final _redirectUrl = "http://localhost/";
  final _discoveryUrl =

      "https://thecigarkeyb2c.b2clogin.com/Thecigarkeyb2c.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_signup";
  final List<String> _scopes = ['openid'];

  void loadData() async {
      final authorizeTokenRequest = AuthorizationTokenRequest(_cliendId, _redirectUrl,
              discoveryUrl: _discoveryUrl, scopes: _scopes);
      final result = await appAuth.authorizeAndExchangeCode(authorizeTokenRequest);

      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Azure Authentication"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            loadData();
          }, child: Text("Sign in"))
        ],
      ),
    );
  }
}
