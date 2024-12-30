import 'package:flutter/material.dart';
import 'climate_services_course_screen.dart'; // Corrected path

class ClimateServicesCourseLevelsScreen extends StatelessWidget {
  final String programName;

  const ClimateServicesCourseLevelsScreen({
    super.key,
    required this.programName,
  });

  @override
  Widget build(BuildContext context) {
    final levels = ["L100", "L200", "L300", "L400"];

    final l100Courses = [
      {
        "code": "CLSE 10",
        "name": "Introduction to Climate Science",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 10",
        "name": "Introduction to Environmental Science",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
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
      {
        "code": "CLSE 10",
        "name": "Basics of Climate Change",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 10",
        "name": "Fundamentals of Meteorology",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    final l200Courses = [
      {
        "code": "CLSE 20",
        "name": "Climate Change Impacts and Adaptation",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 20",
        "name": "Climatology and Weather Patterns",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 20",
        "name": "Research Methods in Climate Sciences",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 20",
        "name": "Remote Sensing for Climate Analysis",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 20",
        "name": "Climate Policy and Governance",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    final l300Courses = [
      {
        "code": "CLSE 30",
        "name": "Climate Modeling and Projections",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 30",
        "name": "Climate Services and Decision-Making",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 30",
        "name": "Carbon Footprint Assessment",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 30",
        "name": "Climate Economics and Finance",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 30",
        "name": "Climate Ethics and Justice",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    final l400Courses = [
      {
        "code": "CLSE 40",
        "name": "Climate Change and Water Resources",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 40",
        "name": "Climate Change and Ecosystems",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 40",
        "name": "Climate Resilience and Adaptation Planning",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "CLSE 40",
        "name": "Climate Data Analysis and Modeling Techniques",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "CLSE 40",
        "name": "Elective Course 3 (Climate and Energy Systems)",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
    ];

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
                List<Map<String, dynamic>> courses = [];

                if (levels[index] == "L100") {
                  courses = l100Courses;
                } else if (levels[index] == "L200") {
                  courses = l200Courses;
                } else if (levels[index] == "L300") {
                  courses = l300Courses;
                } else if (levels[index] == "L400") {
                  courses = l400Courses;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClimateServicesCoursesScreen(
                      level: levels[index],
                      courses: courses,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
