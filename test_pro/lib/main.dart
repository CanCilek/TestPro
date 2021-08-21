import 'package:flutter/material.dart';
import 'package:test_pro/screen/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test Pro',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: TestProHomePage(),
        initialRoute: "/",
        routes: {
          "/": (context) => TestProHomePage(),
          // "/signin": (context) => LoginDemo(),
          // "/name": (context) => DescriptionName(),
          // "/toggle": (context) => Register(),
          // "/signup": (context) => SignUpView(),
          //  "/gender": (context) => GenderPage("ddd", "ddddff", "ffff", "ffffrf"),
          // "/age": (context) => Age(),
          // "/lenght": (context) => Lenght(),
          // "/weight": (context) => Weight(),
        });
  }
}
