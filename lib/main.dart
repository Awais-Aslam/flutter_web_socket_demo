import 'package:flutter/material.dart';
import 'package:flutter_web_socket_demo/pages/home_page.dart';

import 'constants/strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
