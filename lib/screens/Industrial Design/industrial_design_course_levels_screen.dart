import 'package:flutter/material.dart';
import 'industrial_design_courses_screen.dart'; // Ensure this is the correct path

class IndustrialDesignCourseLevelsScreen extends StatelessWidget {
  final String programName;

  const IndustrialDesignCourseLevelsScreen({
    super.key,
    required this.programName,
  });

  @override
  Widget build(BuildContext context) {
    final levels = ["L100", "L200", "L300", "L400"];

    // L100 Courses
    final l100Courses = [
      {
        "code": "IDEG10",
        "name": "Introduction to Industrial Design and Engineering",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG10",
        "name": "Principles of Engineering Design",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "MATH10",
        "name": "Applied Mathematics for Engineers",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG10",
        "name": "Introduction to Materials Science",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE10",
        "name": "Information Technology",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE10",
        "name": "Computer Programming",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE10",
        "name": "Communication Skills",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    // L200 Courses
    final l200Courses = [
      {
        "code": "IDEG20",
        "name": "Ergonomics and Human Factors in Design",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "IDEG20",
        "name": "Industrial Design Studio I",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG20",
        "name": "Electrical and Electronic Engineering",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG20",
        "name": "Prototyping and Model Making",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG20",
        "name": "Project Management for Engineers",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE20",
        "name": "Computer Programming",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE20",
        "name": "Communication Skills",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "UWSE20",
        "name": "Information Technology",
        "theory": 1,
        "practical": 1,
        "creditHours": 2,
        "selected": false,
      },
    ];

    // L300 Courses
    final l300Courses = [
      {
        "code": "IDEG30",
        "name": "Product Design and Development",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG30",
        "name": "Engineering Economics and Cost Analysis I",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG30",
        "name": "Industrial Automation and Robotics",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG30",
        "name": "Industrial Design Studio III",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG30",
        "name": "Quality Control and Assurance",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
    ];

    // L400 Courses
    final l400Courses = [
      {
        "code": "IDEG40",
        "name": "Industrial Design Studio V",
        "theory": 1,
        "practical": 2,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG40",
        "name": "Entrepreneurship and Business Development",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
        "selected": false,
      },
      {
        "code": "IDEG40",
        "name": "Control Systems",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG40",
        "name": "Engineering Economics and Cost Analysis II",
        "theory": 3,
        "practical": 0,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG40",
        "name": "Engineering Ethics and Professional Practice",
        "theory": 2,
        "practical": 1,
        "creditHours": 3,
        "selected": false,
      },
      {
        "code": "IDEG40",
        "name": "Project",
        "theory": 2,
        "practical": 0,
        "creditHours": 2,
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
                if (levels[index] == "L100") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IndustrialDesignEngineeringCoursesScreen(
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
                          IndustrialDesignEngineeringCoursesScreen(
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
                          IndustrialDesignEngineeringCoursesScreen(
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
                          IndustrialDesignEngineeringCoursesScreen(
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
