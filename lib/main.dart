import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UWSEApp()); // Use UWSEApp here
}

class UWSEApp extends StatelessWidget {
  const UWSEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UWSE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const LoginScreen(),
    );
  }
}

// Global Data
List<Map<String, String>> registeredStudents = [];
List<Map<String, String>> registeredLecturers = [];
Map<String, String> currentUser = {};

List<Map<String, String>> results = [
  {'studentId': '12345', 'courseName': 'Mathematics', 'grade': 'A'},
  {'studentId': '12345', 'courseName': 'Science', 'grade': 'B'},
  {'studentId': '67890', 'courseName': 'History', 'grade': 'A'},
];

List<Map<String, String>> libraryMaterials = [
  {'title': 'Flutter for Beginners', 'author': 'John Doe'},
  {'title': 'Advanced Dart', 'author': 'Jane Smith'},
];

List<Map<String, String>> learningMaterials = [];
List<Map<String, dynamic>> chats = [];
