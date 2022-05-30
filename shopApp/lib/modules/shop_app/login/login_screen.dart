import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/register/register_screen.dart';
import 'package:shop_app/shared/compontents/compontents.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailContoller = TextEditingController();
    var passContoller = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("login", style: Theme.of(context).textTheme.headline5),
              Text("login now to get our products",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.grey)),
              SizedBox(
                height: 30,
              ),
              defaultInput(
                  controller: emailContoller,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please insert Email';
                    }
                    return null;
                  },
                  label: "Email Adress",
                  prefix: Icons.email_outlined),
              SizedBox(
                height: 20,
              ),
              defaultInput(
                  controller: passContoller,
                  type: TextInputType.visiblePassword,
                  suffix: Icons.visibility_outlined,
                  suffixIconPress: () {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please insert Password';
                    }
                    return null;
                  },
                  label: "Password",
                  prefix: Icons.lock_outline),
              SizedBox(
                height: 20,
              ),
              defaultButton(function: () {}, text: "Login"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Don't have account "),
                ],
              )
            ],
          ),
        ));
  }
}
