import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  final String courseName;
  final String location;
  final double rating;
  final Function(String, String, double) onCourseUpdated; // 콜백 추가

  const EditCourseScreen({
    required this.courseName,
    required this.location,
    required this.rating,
    required this.onCourseUpdated, // 콜백 받기
    super.key,
  });

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  late TextEditingController _courseNameController;
  late TextEditingController _locationController;
  late TextEditingController _ratingController;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController(text: widget.courseName);
    _locationController = TextEditingController(text: widget.location);
    _ratingController = TextEditingController(text: widget.rating.toString());
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
          "코스 수정",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("코스 이름",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _courseNameController),
            const SizedBox(height: 16),
            const Text("장소",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _locationController),
            const SizedBox(height: 16),
            const Text("별점",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
                controller: _ratingController,
                keyboardType: TextInputType.number),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                widget.onCourseUpdated(
                  _courseNameController.text,
                  _locationController.text,
                  double.tryParse(_ratingController.text) ?? 0.0,
                );
                Navigator.pop(context); // 이전 화면으로 돌아가기
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("수정 완료"),
            ),
          ],
        ),
      ),
    );
  }
}
