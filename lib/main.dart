import 'package:flutter/material.dart';
import 'package:shop/routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute
    );
  }
}
