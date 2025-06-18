import 'package:flutter/material.dart';
import 'package:dermaapp/services/database.dart';

void main() {
  // Ambil variabel lingkungan dari GitHub Actions atau platform lain
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
    return MaterialApp(home: HomeScreen(dbService: dbService));
  }
}

class HomeScreen extends StatefulWidget {
  final DatabaseService dbService;

  const HomeScreen({required this.dbService, super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.dbService.connect();
  }

  @override
  void dispose() {
    widget.dbService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neon PostgreSQL with Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await widget.dbService.addUser('John Doe', 'john@example.com');
              },
              child: const Text('Add User'),
            ),
            ElevatedButton(
              onPressed: () async {
                var users = await widget.dbService.getUsers();
                print(users);
              },
              child: const Text('Get Users'),
            ),
          ],
        ),
      ),
    );
  }
}
