import 'package:flutter/material.dart';
import 'package:dermaapp/services/database.dart';
import 'package:dermaapp/pages/start/splash_screen.dart';
import 'package:dermaapp/pages/start/register.dart';
import 'package:dermaapp/pages/start/login.dart';
import 'package:dermaapp/pages/home/home.dart';
import 'package:dermaapp/pages/home/card_detail.dart';
import 'package:dermaapp/pages/home/recommendation.dart';
import 'package:dermaapp/pages/analysis/scan_condition.dart';
import 'package:dermaapp/pages/products/product_home.dart';
import 'package:dermaapp/pages/products/scan_product.dart';

void main() {
  final dbService = DatabaseService(
    host: const String.fromEnvironment('DB_HOST'),
    port: int.parse(
      const String.fromEnvironment('DB_PORT', defaultValue: '5432'),
    ),
    databaseName: const String.fromEnvironment('DB_NAME'),
    username: const String.fromEnvironment('DB_USERNAME'),
    password: const String.fromEnvironment('DB_PASSWORD'),
  );

  runApp(MyApp(dbService: dbService));
}

class MyApp extends StatelessWidget {
  final DatabaseService dbService;

  const MyApp({required this.dbService, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/card_detail': (context) => const CardDetail(),
        '/recommendation': (context) => const Recommendation(),
        '/scan_condition': (context) => const ScanCondition(),
        '/scan_product': (context) => const ScanProduct(),
        '/product_home': (context) => const ProductHome(),
      },
    );
  }
}
