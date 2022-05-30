import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:shop_app/modules/shop_app/login/cubit/states.dart';
import 'package:shop_app/modules/shop_app/register/shop_register_screen.dart';
import 'package:shop_app/shared/compontents/compontents.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailContoller = TextEditingController();
    var passContoller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "login",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
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
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingStates,
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailContoller.text,
                                      password: passContoller.text);
                                }
                              },
                              text: "Login",
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have account "),
                              defaultTextButton(
                                  label: 'register',
                                  function: () {
                                    navagetAndFinish(
                                      context,
                                      ShopRegisterScreen(),
                                    );
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
