import 'package:flutter/material.dart';
import '../components/white_box1.dart'; // WhiteBox 가져오기
import 'date_plan.dart'; // DatePlan 가져오기
import 'date_log.dart';
import 'date_course.dart';

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFB21C44), // 전체 배경색 설정 (빨간색)
        child: Column(
          children: [
            // 첫 번째 WhiteBox
            WhiteBox(
              title: "다가오는 데이트 일정",
              date: "D - n일",
              dateDetails: "(데이트날짜)",
              location: "(장소이름)",
              locationDetails: "외 1개 장소",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DatePlan()), // DatePlan으로 이동
                );
              },
            ),

            // WhiteBox 사이 간격
            SizedBox(height: 1.0),

            // 두 번째 WhiteBox (최근 데이트 로그)
            WhiteBox(
              title: "최근 데이트 로그",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 왼쪽 사진 영역
                  _buildImageSection(),

                  // 오른쪽 정보 영역
                  _buildInfoSection(),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DateLog()), // DateLog으로 이동
                );
              },
            ),

            // WhiteBox 사이 간격
            SizedBox(height: 1.0),

            // 새로운 WhiteBox (서랍 (코스))
            WhiteBox(
              title: "서랍 (코스)",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLocationBox("장소"),
                  _buildLocationBox("대표 장소"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DateCourse()), // DateCourse으로 이동
                );
              },
            ),

            // 마지막 여백
            SizedBox(height: 16.0),

            Expanded(
              child: Container(), // 나머지 공간은 투명하게 유지
            ),
          ],
        ),
      ),
    );
  }

  // 이미지 섹션
  Widget _buildImageSection() {
    return Container(
      width: 120,
      height: 160,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          "assets/images/Sample_Image.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 정보 섹션
  Widget _buildInfoSection() {
    return Expanded(
      child: Column(
        children: [
          // 상단 정보
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoText("기록 뱃지"),
                _buildInfoText("걸음 수"),
                _buildInfoText("방문 수"),
                _buildInfoText("데이트 상대의 한마디"),
              ],
            ),
          ),
          // 하단 대표 장소
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                "대표 장소",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 정보 텍스트
  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      ),
    );
  }

  // 장소 박스
  Widget _buildLocationBox(String title) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 4.0), // 간격 추가
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
