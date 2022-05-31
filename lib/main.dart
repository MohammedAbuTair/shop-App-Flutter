import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_bording_screen.dart';
import 'package:shop_app/shared/network/remote/dioHelper.dart';
import 'package:shop_app/shared/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,

      darkTheme: darkTheme,
      themeMode: false ? ThemeMode.dark : ThemeMode.light,

      // home: HomeLayout(),
      // home: LoginScreen(),
      // home: HomePage(),
      // home: Messages(),
      // home: UsersScreen(),
      // home: CounterScreen(),
      // home: BmiScreen(),
      // home: BMIResult(),
      home: Directionality(
        child: OnBoradingScreen(),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
