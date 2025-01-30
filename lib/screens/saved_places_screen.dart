import 'package:flutter/material.dart';
import 'create_course_screen.dart';
import 'edit_course_screen.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  List<Map<String, dynamic>> courses = [
    {"name": "기존 코스 1", "location": "장소 A", "rating": 4.5},
    {"name": "기존 코스 2", "location": "장소 B", "rating": 4.2},
  ];

  void _addCourse(String name, String location, double rating) {
    setState(() {
      courses.add({"name": name, "location": location, "rating": rating});
    });
  }

  void _updateCourse(int index, String name, String location, double rating) {
    setState(() {
      courses[index] = {"name": name, "location": location, "rating": rating};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "저장된 모든 장소",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "편집",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            "${courses.length}개의 코스",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return _buildCourseItem(
                  index,
                  course["name"],
                  course["location"],
                  course["rating"],
                );
              },
            ),
          ),

          // 코스 짜기 버튼
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateCourseScreen(
                      onCourseCreated: _addCourse,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
                foregroundColor: Colors.black,
              ),
              child: const Text("코스 짜기"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseItem(
      int index, String name, String location, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditCourseScreen(
              courseName: name,
              location: location,
              rating: rating,
              onCourseUpdated: (newName, newLocation, newRating) {
                _updateCourse(index, newName, newLocation, newRating);
              },
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(location, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    "별점: $rating",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
