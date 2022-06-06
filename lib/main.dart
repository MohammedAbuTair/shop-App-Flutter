import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/modules/shop_app/on_boarding/on_bording_screen.dart';
import 'package:shop_app/shared/compontents/constants.dart';
import 'package:shop_app/shared/network/remote/dioHelper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:shop_app/shared/network/local/cacheHelpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelpers.init();
  bool isDark = CacheHelpers.getData(key: 'isDark') ?? false;
  Widget widget;
  bool onBording = CacheHelpers.getData(key: 'onBording') ?? false;
  token = CacheHelpers.getData(key: 'token') ?? "";

  if (onBording != null) {
    if (token != "") {
      widget = ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoradingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark, required this.startWidget})
      : super(key: key);
  final bool isDark;
  final Widget startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ShopCubit()..getHomeData()),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,

            darkTheme: darkTheme,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

            // home: HomeLayout(),
            // home: LoginScreen(),
            // home: HomePage(),
            // home: Messages(),
            // home: UsersScreen(),
            // home: CounterScreen(),
            // home: BmiScreen(),
            // home: BMIResult(),
            home: Directionality(
              child: startWidget,
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
