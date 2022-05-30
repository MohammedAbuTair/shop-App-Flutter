import 'package:flutter/material.dart';
import 'package:shop_app/shared/compontents/compontents.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailContoller = TextEditingController();
    var passContoller = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(),
        ));
  }
}
