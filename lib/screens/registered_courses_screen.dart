import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisteredCoursesScreen extends StatefulWidget {
  const RegisteredCoursesScreen(
      {super.key, required String semester, required String studentId});

  @override
  State<RegisteredCoursesScreen> createState() =>
      _RegisteredCoursesScreenState();
}

class _RegisteredCoursesScreenState extends State<RegisteredCoursesScreen> {
  List<Map<String, dynamic>> _registeredCourses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRegisteredCourses();
  }

  Future<void> _loadRegisteredCourses() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      // Fetch the index number from the students collection
      final studentDoc = await FirebaseFirestore.instance
          .collection('students')
          .doc(user.uid)
          .get();

      if (!studentDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student record not found.')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final indexNumber = studentDoc.data()?['indexNumber'];

      if (indexNumber == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Index number not found.')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Fetch the registered courses for semester 1 using the index number
      final coursesDoc = await FirebaseFirestore.instance
          .collection('registered_courses')
          .doc(indexNumber)
          .get();

      if (coursesDoc.exists) {
        final courses = List<Map<String, dynamic>>.from(
          coursesDoc.data()?['courses'] ?? [],
        );

        // Filter for semester 1
        final semester1Courses =
            courses.where((course) => course['semester'] == 1).toList();

        setState(() {
          _registeredCourses = semester1Courses;
          _isLoading = false;
        });
      } else {
        setState(() {
          _registeredCourses = [];
          _isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading courses: $e')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Courses'),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _registeredCourses.isEmpty
              ? const Center(
                  child: Text(
                    'No registered courses found for Semester 1.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: _registeredCourses.length,
                  itemBuilder: (context, index) {
                    final course = _registeredCourses[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('${course['code']}: ${course['name']}'),
                        subtitle: Text(
                          'Credits: ${course['creditHours']} '
                          '(Theory: ${course['theory']}, Practical: ${course['practical']})',
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
