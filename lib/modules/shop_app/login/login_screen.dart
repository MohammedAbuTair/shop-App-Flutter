import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:shop_app/modules/shop_app/login/cubit/states.dart';
import 'package:shop_app/modules/shop_app/register/shop_register_screen.dart';
import 'package:shop_app/shared/compontents/compontents.dart';
import 'package:shop_app/shared/network/local/cacheHelpers.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailContoller = TextEditingController();
    var passContoller = TextEditingController();
    emailContoller.text = 'm7@gmail.com';
    passContoller.text = '123456';
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
            bool checkUserLogin = state.loginModel.status ?? false;
            // if (emailContoller.text == "tair@gmail.com") {
            //   checkUserLogin = true;
            // } else {
            // checkUserLogin = false;
            // }
            if (checkUserLogin) {
              showToast(
                state: ToastStates.SUCESS,
                text: "Done",
              );
              CacheHelpers.saveData(
                      key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                if (value) {
                  navagetAndFinish(
                    context,
                    ShopLayout(),
                  );
                }
              });
            } else {
              showToast(
                state: ToastStates.ERROR,
                text: "Pass Or Email Worng !",
              );
            }
          }
        },
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
                              suffix: ShopLoginCubit.get(context).suffix,
                              suffixIconPress: () {
                                ShopLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              isPassword:
                                  ShopLoginCubit.get(context).isPasswordShow,
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailContoller.text,
                                      password: passContoller.text);
                                }
                              },
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
