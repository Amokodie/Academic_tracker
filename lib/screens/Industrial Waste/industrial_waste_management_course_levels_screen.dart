import 'package:flutter/material.dart';
import 'industrial_waste_management_courses_screen.dart';

class IndustrialWasteManagementCourseLevelsScreen extends StatelessWidget {
  final String programName;

  const IndustrialWasteManagementCourseLevelsScreen({
    super.key,
    required this.programName,
  });

  @override
  Widget build(BuildContext context) {
    final levels = ["L100", "L200", "L300", "L400"];

    // L100 Courses
    final l100Courses = [
      {
        "code": "INWM 10",
        "name": "Principles of Chemistry",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "INWM 10",
        "name": "Introduction to Industrial Waste Management",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "MATH 10",
        "name": "Mathematics for Climate Sciences",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
    ];

    // L200 Courses
    final l200Courses = [
      {
        "code": "INWM 20",
        "name": "Physical and Chemical Processes for Waste Treatment",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
    ];

    // L300 Courses
    final l300Courses = [
      {
        "code": "INWM 30",
        "name": "Landfill Design and Management",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
    ];

    // L400 Courses
    final l400Courses = [
      {
        "code": "INWM 40",
        "name": "Environmental Auditing and Certification",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("$programName - Levels"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(levels[index]),
              onTap: () {
                if (levels[index] == "L100") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IndustrialWasteManagementCoursesScreen(
                        level: "L100",
                        courses: l100Courses,
                      ),
                    ),
                  );
                } else if (levels[index] == "L200") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IndustrialWasteManagementCoursesScreen(
                        level: "L200",
                        courses: l200Courses,
                      ),
                    ),
                  );
                } else if (levels[index] == "L300") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IndustrialWasteManagementCoursesScreen(
                        level: "L300",
                        courses: l300Courses,
                      ),
                    ),
                  );
                } else if (levels[index] == "L400") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IndustrialWasteManagementCoursesScreen(
                        level: "L400",
                        courses: l400Courses,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
