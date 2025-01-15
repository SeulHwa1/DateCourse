import 'package:flutter/material.dart';
import 'date_log_detail.dart'; // 상세 로그 화면 import

class MonthlyDateLog extends StatelessWidget {
  const MonthlyDateLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("월간 데이트 로그"),
        backgroundColor: const Color(0xFFB21C44),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "2025년 1월",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Table(
                children: [
                  for (int i = 0; i < 5; i++)
                    TableRow(
                      children: List.generate(
                        7,
                        (index) {
                          final day = i * 7 + index + 1;
                          if (day > 31) {
                            return Container(); // 빈 날짜
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DateLogDetail(date: day),
                                ),
                              );
                            },
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  day.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
