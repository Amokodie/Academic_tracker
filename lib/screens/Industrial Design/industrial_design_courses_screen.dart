import 'package:flutter/material.dart';

class IndustrialDesignEngineeringCoursesScreen extends StatefulWidget {
  final String level;
  final List<Map<String, dynamic>> courses;

  const IndustrialDesignEngineeringCoursesScreen({
    super.key,
    required this.level,
    required this.courses,
  });

  @override
  State<IndustrialDesignEngineeringCoursesScreen> createState() =>
      _IndustrialDesignEngineeringCoursesScreenState();
}

class _IndustrialDesignEngineeringCoursesScreenState
    extends State<IndustrialDesignEngineeringCoursesScreen> {
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

  @override
  Widget build(BuildContext context) {
    final totalCredits = courses.fold<int>(
      0,
      (sum, course) =>
          sum + (course["selected"] ? (course["creditHours"] as int) : 0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Industrial Design Engineering - ${widget.level} Courses"),
        backgroundColor: Colors.blue,
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
                    if (totalCredits == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("No courses selected for registration."),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Successfully registered for $totalCredits credit hours."),
                        ),
                      );
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
