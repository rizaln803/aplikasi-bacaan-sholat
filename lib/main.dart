import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/page/main_page.dart';
import 'package:flutter_application_1/page/register_page.dart';
import 'package:flutter_application_1/page/komen_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LogIn(),
        'regis_screen': (context) => Register(),
        'home_screen': (context) => MainPage()
      },
    );
  }
}