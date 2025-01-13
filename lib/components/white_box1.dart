import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {
  final String title;
  final String? date;
  final String? dateDetails;
  final String? location;
  final String? locationDetails;
  final VoidCallback onTap;
  final Widget? child;

  const WhiteBox({
    super.key,
    required this.title,
    this.date,
    this.dateDetails,
    this.location,
    this.locationDetails,
    required this.onTap,
<<<<<<< HEAD
    this.child,
  }) : super(key: key);
=======
  });
>>>>>>> 7f1ebd3500cc8fbee05e2097cf2dbff4d5773343

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 8.0),
                if (date != null) _buildDateSection(),
                if (location != null) _buildLocationSection(),
                if (child != null) ...[SizedBox(height: 8.0), child!],
                SizedBox(height: 16.0), // 하단 여백
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 상단 제목과 화살표
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 18.0,
        ),
      ],
    );
  }

  // 날짜 섹션
  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date!,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        if (dateDetails != null)
          Text(
            dateDetails!,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
      ],
    );
  }

  // 위치 섹션
  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location!,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        if (locationDetails != null)
          Text(
            locationDetails!,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
      ],
    );
  }
}
