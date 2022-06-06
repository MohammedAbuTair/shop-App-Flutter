import 'package:flutter/material.dart';

class FavaritesScreen extends StatelessWidget {
  const FavaritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favarites Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
