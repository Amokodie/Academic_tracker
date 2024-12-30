import 'package:flutter/material.dart';
import '../global.dart';
import 'results_screen.dart';
import 'library_screen.dart';
import 'learning_materials_screen.dart';
import 'chat_screen.dart';
import 'registered_courses_screen.dart'; // Corrected import for RegisteredCoursesScreen
import 'programs_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard(
      {super.key, required String indexNumber, required String studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard - ${currentUser['name']}"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.blue),
            title: const Text("View My Results"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books, color: Colors.blue),
            title: const Text("Access Library"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LibraryScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Colors.blue),
            title: const Text("Learning Materials"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LearningMaterialsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.blue),
            title: const Text("Chat with Lecturers"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.how_to_reg, color: Colors.blue),
            title: const Text("Registered Courses"),
            onTap: () {
              final studentId = currentUser['id'] ?? 'unknown-id';
              final semester = currentUser['semester'] ?? 'Spring 2024';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisteredCoursesScreen(
                    studentId: studentId,
                    semester: semester,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.explore, color: Colors.blue),
            title: const Text("Explore Programs"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProgramsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
