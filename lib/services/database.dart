import 'package:postgres/postgres.dart';

class DatabaseService {
  late PostgreSQLConnection _connection;

  DatabaseService({
    required String host,
    required int port,
    required String databaseName,
    required String username,
    required String password,
  }) {
    _connection = PostgreSQLConnection(
      host,
      port,
      databaseName,
      username: username,
      password: password,
      useSSL: true, // Neon memerlukan SSL
      timeoutInSeconds: 30,
    );
  }

  Future<void> connect() async {
    try {
      await _connection.open();
      print('Connected to Neon PostgreSQL');
    } catch (e) {
      print('Error connecting to database: $e');
    }
  }

  // Contoh: Menambahkan data ke tabel 'users'
  Future<void> addUser(String name, String email) async {
    try {
      await _connection.query(
        'INSERT INTO users (name, email) VALUES (@name, @email) RETURNING id',
        substitutionValues: {'name': name, 'email': email},
      );
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Contoh: Mengambil data dari tabel 'users'
  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      var results = await _connection.query('SELECT * FROM users');
      return results
          .map((row) => {'id': row[0], 'name': row[1], 'email': row[2]})
          .toList();
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  Future<void> close() async {
    await _connection.close();
    print('Database connection closed');
  }
}
