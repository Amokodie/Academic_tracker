import 'package:flutter/material.dart';
import 'ecological_courses_screen.dart'; // Ensure this path is correct

class EcologicalEngineeringCourseLevelsScreen extends StatelessWidget {
  final String programName;

  const EcologicalEngineeringCourseLevelsScreen({
    super.key,
    required this.programName,
  });

  @override
  Widget build(BuildContext context) {
    final levels = ["L100", "L200", "L300", "L400"];
    final semesters = ["Semester 1", "Semester 2"];

    // All courses for each level
    final Map<String, List<Map<String, dynamic>>> allCourses = {
      "L100": [
        {
          "code": "ECEG10",
          "name": "Introduction to Ecological Engineering",
          "theory": 3,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "ECEG11",
          "name": "English Composition",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "MATH10",
          "name": "Calculus I",
          "theory": 3,
          "practical": 0,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG12",
          "name": "General Chemistry",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG13",
          "name": "Introduction to Environmental Science",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "UWSE14",
          "name": "Information Technology",
          "theory": 1,
          "practical": 1,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "UWSE15",
          "name": "Computer Programming",
          "theory": 1,
          "practical": 1,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "UWSE16",
          "name": "Communication Skills",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
      ],
      "L200": [
        {
          "code": "ECEG20",
          "name": "Ecological Modeling and Simulation",
          "theory": 1,
          "practical": 2,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "MATH20",
          "name": "Differential Equations",
          "theory": 3,
          "practical": 0,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG21",
          "name": "Organic Chemistry",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG22",
          "name": "Environmental Ethics",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "ECEG23",
          "name": "Introduction to Soil Science",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "UWSE24",
          "name": "Advanced Computer Programming",
          "theory": 1,
          "practical": 1,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "UWSE25",
          "name": "Technical Writing",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
      ],
      "L300": [
        {
          "code": "ECEG30",
          "name": "Water Resources Engineering",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG31",
          "name": "Environmental Biotechnology",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG32",
          "name": "Ecological Restoration",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "ECEG33",
          "name": "Renewable Energy Systems",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG34",
          "name": "Environmental Law and Policy",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
      ],
      "L400": [
        {
          "code": "ECEG40",
          "name": "Environmental Risk Assessment",
          "theory": 3,
          "practical": 0,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG41",
          "name": "Environmental Management Systems",
          "theory": 2,
          "practical": 0,
          "creditHours": 2,
          "selected": false,
        },
        {
          "code": "ECEG42",
          "name": "Environmental Geotechnics",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG43",
          "name": "Environmental Psychology",
          "theory": 3,
          "practical": 0,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG44",
          "name": "Environmental Impact Analysis",
          "theory": 3,
          "practical": 0,
          "creditHours": 3,
          "selected": false,
        },
        {
          "code": "ECEG45",
          "name": "Capstone Project",
          "theory": 2,
          "practical": 1,
          "creditHours": 3,
          "selected": false,
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("$programName - Levels"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(levels[index]),
              onTap: () {
                // Navigate to select semester
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: semesters.length,
                      itemBuilder: (context, semesterIndex) {
                        return ListTile(
                          title: Text(semesters[semesterIndex]),
                          onTap: () {
                            Navigator.pop(context); // Close the bottom sheet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EcologicalEngineeringCoursesScreen(
                                  level: levels[index],
                                  semester: semesters[semesterIndex],
                                  courses: allCourses[levels[index]]!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
