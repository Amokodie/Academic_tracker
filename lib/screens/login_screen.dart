import 'package:flutter/material.dart';
import 'package:uwse_tracker/screens/student_dashboard.dart';
import 'signup_screen.dart';
import '../Page/lecturer_dashboard.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String userType = 'Student';

  void login() {
    final identifier = identifierController.text.trim();
    final password = passwordController.text.trim();

    if (userType == 'Student') {
      final Map<String, String> student = registeredStudents.firstWhere(
        (student) =>
            student['index'] == identifier && student['password'] == password,
        orElse: () => {}, // Return an empty map if no student matches
      );

      if (student.isNotEmpty) {
        currentUser = student;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDashboard(
              studentName: student['name'] ?? 'Student',
              indexNumber: student['index'] ?? 'N/A',
            ),
          ),
        );
        return;
      }
    } else if (userType == 'Lecturer') {
      final Map<String, String> lecturer = registeredLecturers.firstWhere(
        (lecturer) =>
            lecturer['email'] == identifier && lecturer['password'] == password,
        orElse: () => {},
      );

      if (lecturer.isNotEmpty) {
        currentUser = lecturer;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LecturerDashboard()),
        );
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid credentials')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UWSE',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: userType,
              items: const [
                DropdownMenuItem(value: 'Student', child: Text('Student')),
                DropdownMenuItem(value: 'Lecturer', child: Text('Lecturer')),
              ],
              onChanged: (value) {
                setState(() {
                  userType = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Login as'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: identifierController,
              decoration: InputDecoration(
                labelText:
                    userType == 'Student' ? 'Index Number' : 'Email Address',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
