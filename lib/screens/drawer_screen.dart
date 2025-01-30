import 'package:flutter/material.dart';
import 'saved_places_screen.dart'; // 저장된 모든 장소 화면 import

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isPlaceSelected = true; // 장소/코스 선택 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTabButton("장소", isPlaceSelected, () {
              setState(() {
                isPlaceSelected = true;
              });
            }),
            _buildTabButton("코스", !isPlaceSelected, () {
              setState(() {
                isPlaceSelected = false;
              });
            }),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // 정렬 버튼들
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSortButton("저장순"),
                _buildSortButton("개수순"),
                _buildSortButton("이름순"),
              ],
            ),
            const SizedBox(height: 16),

            // 장소 또는 코스 리스트 (isPlaceSelected에 따라 화면 변경)
            Expanded(
              child: isPlaceSelected ? _buildPlaceList() : _buildCourseList(),
            ),
          ],
        ),
      ),
    );
  }

  /// 장소 탭에서 보이는 리스트
  Widget _buildPlaceList() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedPlacesScreen(),
              ),
            );
          },
          child: _buildGridItem("저장된 모든 장소", "6개의 장소"),
        ),
        _buildGridItem("공유된 장소", "2개의 장소"),
        _buildGridItem("최근 선택한 장소", "2개의 장소"),
        _buildAddNewItem(),
      ],
    );
  }

  /// 코스 탭에서 보이는 리스트 (첨부된 이미지처럼 구성)
  Widget _buildCourseList() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      children: [
        _buildGridItem("저장된 모든 코스", "6개의 코스"),
        _buildGridItem("다녀온 코스", "2개의 코스"),
        _buildGridItem("공유된 코스", "2개의 코스"),
        _buildAddNewItem(),
      ],
    );
  }

  /// 상단 탭 버튼 (장소/코스 선택)
  Widget _buildTabButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// 정렬 버튼
  Widget _buildSortButton(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  /// 리스트 아이템 생성
  Widget _buildGridItem(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 새로운 목록 추가 버튼
  Widget _buildAddNewItem() {
    return GestureDetector(
      onTap: () {
        // 새 목록 추가 기능
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
