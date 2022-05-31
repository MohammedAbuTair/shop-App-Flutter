import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  // double border = 10.0,
  Color background = Colors.blue,
  required function,
  required text,
}) {
  return Container(
    width: width,
    height: 50,
    color: background,
    // decoration: BoxDecoration(
    //   color: background,
    // ),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget defaultInput({
  required TextEditingController controller,
  required TextInputType type,
  Function(String? val)? onSubmit,
  Function(String? val)? onChange,
  Function? suffixIconPress,
  required String? Function(String? val)? validate,
  required String label,
  bool isPassword = false,
  required IconData prefix,
  IconData? suffix,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validate,
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixIconPress!();
                })
            : null,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))),
  );
}

Widget defaultTextButton({
  required String label,
  required Function() function,
}) {
  return TextButton(onPressed: function, child: Text(label.toUpperCase()));
}

Widget myDivider(context) => Row(children: [
      Expanded(
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Theme.of(context).backgroundColor,
              height: 5,
            )),
      ),
    ]);

void navgateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navagetAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Widget),
    (Route<dynamic> route) => false);
