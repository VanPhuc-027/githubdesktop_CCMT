import 'package:flutter/material.dart';

class ExamScheduleScreen extends StatefulWidget {
  const ExamScheduleScreen({super.key});

  @override
  State<ExamScheduleScreen> createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  // Sample data for exams
  final List<ExamData> examList = [
    ExamData(
      title: 'Cơ sở lập trình',
      date: 'Ngày thi: 18 tháng 2 năm 2026',
      time: 'Giờ thi: 10:00 - 12:00',
      room: 'Phòng: P101',
      note: 'Hình thức: Trắc nghiệm',
    ),
    ExamData(
      title: 'Cơ sở dự liệu',
      date: 'Ngày thi: 20 tháng 2 năm 2026',
      time: 'Giờ thi: 10:00 - 12:00',
      room: 'Phòng: P103',
      note: 'Hình thức: Tự luận',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch Thi'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton('Tất cả', false),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTabButton('Sắp thi', true),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTabButton('Đã thi', false),
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...examList.map((examData) => _buildExamCard(examData)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Môn học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Lịch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExamCard(ExamData examData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(
            color: Colors.red.shade300,
            width: 4,
          ),
          top: BorderSide(color: Colors.grey.shade200),
          right: BorderSide(color: Colors.grey.shade200),
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              examData.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.calendar_today, examData.date),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.schedule, examData.time),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.location_on, examData.room),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.info, examData.note),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class ExamData {
  final String title;
  final String date;
  final String time;
  final String room;
  final String note;

  ExamData({
    required this.title,
    required this.date,
    required this.time,
    required this.room,
    required this.note,
  });
}
