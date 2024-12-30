import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EcologicalEngineeringCoursesScreen extends StatefulWidget {
  final String level;
  final List<Map<String, dynamic>> courses;

  const EcologicalEngineeringCoursesScreen({
    super.key,
    required this.level,
    required this.courses,
  });

  @override
  State<EcologicalEngineeringCoursesScreen> createState() =>
      _EcologicalEngineeringCoursesScreenState();
}

class _EcologicalEngineeringCoursesScreenState
    extends State<EcologicalEngineeringCoursesScreen> {
  late List<Map<String, dynamic>> courses;

  @override
  void initState() {
    super.initState();
    courses = widget.courses;
  }

  void toggleCourseSelection(Map<String, dynamic> course) {
    setState(() {
      course["selected"] = !course["selected"];
    });
  }

  Future<void> registerCourses(
      List<Map<String, dynamic>> selectedCourses) async {
    try {
      final firestore = FirebaseFirestore.instance;

      // Save each course to Firestore under the "registered_courses" collection
      for (var course in selectedCourses) {
        await firestore.collection('registered_courses').add({
          "level": widget.level,
          "code": course["code"],
          "name": course["name"],
          "creditHours": course["creditHours"],
          "theory": course["theory"],
          "practical": course["practical"],
          "timestamp": FieldValue.serverTimestamp(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Courses registered successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to register courses: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalCredits = courses.fold<int>(
      0,
      (sum, course) =>
          sum + (course["selected"] ? (course["creditHours"] as int) : 0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Ecological Engineering - ${widget.level} Courses"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];

                return Card(
                  child: ListTile(
                    title: Text("${course["code"]}: ${course["name"]}"),
                    subtitle: Text(
                      "Theory: ${course["theory"]}, Practical: ${course["practical"]}, Credits: ${course["creditHours"]}",
                    ),
                    trailing: Checkbox(
                      value: course["selected"],
                      onChanged: (value) {
                        toggleCourseSelection(course);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Credits: $totalCredits",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    final selectedCourses = courses
                        .where((course) => course["selected"] == true)
                        .toList();

                    if (selectedCourses.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("No courses selected for registration."),
                        ),
                      );
                    } else {
                      registerCourses(selectedCourses);
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
