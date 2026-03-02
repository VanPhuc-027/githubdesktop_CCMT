import 'package:flutter/material.dart';

class StudyScheduleScreen extends StatefulWidget {
  const StudyScheduleScreen({super.key});

  @override
  State<StudyScheduleScreen> createState() => _StudyScheduleScreenState();
}

class _StudyScheduleScreenState extends State<StudyScheduleScreen> {
  DateTime _selectedDate = DateTime.now();

  // Sample data for classes
  final List<ClassData> classList = [
    ClassData(
      name: 'Java Web',
      time: '07:30 - 09:30',
      room: 'Phòng A203',
      teacher: 'GV: Nguyễn Văn A',
    ),
    ClassData(
      name: 'Giải Tích 1',
      time: '10:00 - 12:00',
      room: 'Phòng B013',
      teacher: 'GV: Trần Thị B',
    ),
    ClassData(
      name: 'Tiếng Anh 1',
      time: '13:30 - 15:30',
      room: 'Phòng C015',
      teacher: 'GV: Đào Thị C',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch học'),
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
                  child: _buildTabButton('Hôm nay', true),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTabButton('Tuần', false),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTabButton('Tháng', false),
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
                  // Calendar widget
                  _buildCalendar(),
                  const SizedBox(height: 24),
                  // Classes list
                  const Text(
                    'Lớp học hôm nay',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...classList.map((classData) => _buildClassCard(classData)),
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
        color: isActive ? Colors.blue : Colors.transparent,
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

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tháng 2',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 20),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Calendar grid
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: List.generate(16, (index) {
              final day = index + 12;
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: day == 12 || day == 13 ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: day == 12 || day == 13 ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard(ClassData classData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            classData.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.schedule, classData.time),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.location_on, classData.room),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.person, classData.teacher),
        ],
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
              cInfoRow(IconData icon, String text) {
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

class ClassData {
  final String name;
  final String time;
  final String room;
  final String teacher;

  ClassData({
    required this.name,
    required this.time,
    required this.room,
    required this.teacher