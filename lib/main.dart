import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoutes,
      routes: {
        MyRoutes.loginRoutes: (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.CartRoutes: (context) => CartPage(),
      },
    );
  }
}
