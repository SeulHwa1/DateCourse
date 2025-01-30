import 'package:flutter/material.dart';

class CreateCourseScreen extends StatefulWidget {
  final Function(String, String, double) onCourseCreated;

  const CreateCourseScreen({super.key, required this.onCourseCreated});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

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
          "새로운 코스 생성",
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
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_courseNameController.text.isNotEmpty &&
                    _locationController.text.isNotEmpty &&
                    _ratingController.text.isNotEmpty) {
                  widget.onCourseCreated(
                    _courseNameController.text,
                    _locationController.text,
                    double.tryParse(_ratingController.text) ?? 0.0,
                  );
                  Navigator.pop(context); // 이전 화면으로 이동
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("코스 추가"),
            ),
          ],
        ),
      ),
    );
  }
}
