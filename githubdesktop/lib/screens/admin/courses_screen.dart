import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. Header ---
              const Row(
                children: [
                  Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Courses Configure",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- 2. Search Bar ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Tìm kiếm khóa học...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
              const SizedBox(height: 15),

              // --- 3. Action Buttons (Thêm khóa học & Tìm kiếm nâng cao) ---
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.green),
                      label: const Text(
                        "Thêm khóa học",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF98FB98,
                        ), // Màu xanh nhạt
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Tìm kiếm nâng cao",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFFFFACD,
                        ), // Màu vàng nhạt
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // --- 4. Danh sách các môn học ---

              // Môn Toán
              const _SubjectSection(
                subjectName: "Toán",
                icon: Icons.calculate_outlined,
                children: [
                  _CourseCard(
                    className: "Mã lớp: A001",
                    tag: "MẤT GỐC",
                    teacher: "Nguyễn A",
                    students: 48,
                    revenue: "24.000.000",
                    cardColor: Color(0xFFE57373), // Đỏ cam
                    tagColor: Colors.deepOrange,
                  ),
                  _CourseCard(
                    className: "Mã lớp: A002",
                    tag: "CƠ BẢN",
                    teacher: "Trần B",
                    students: 30,
                    revenue: "15.000.000",
                    cardColor: Color(0xFF64B5F6), // Xanh dương
                    tagColor: Colors.blue,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Môn Tiếng Anh
              const _SubjectSection(
                subjectName: "Tiếng Anh",
                icon: Icons.language,
                children: [
                  _CourseCard(
                    className: "Mã lớp: B001",
                    tag: "MẤT GỐC",
                    teacher: "Nguyễn B",
                    students: 35,
                    revenue: "19.250.000",
                    cardColor: Color(0xFF66BB6A), // Xanh lá
                    tagColor: Colors.green,
                  ),
                  _CourseCard(
                    className: "Mã lớp: B002",
                    tag: "CƠ BẢN",
                    teacher: "Le C",
                    students: 20,
                    revenue: "10.000.000",
                    cardColor: Color(0xFFEC407A), // Hồng đậm
                    tagColor: Colors.pink,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Môn Ngữ Văn
              const _SubjectSection(
                subjectName: "Ngữ Văn",
                icon: Icons.menu_book_rounded,
                children: [
                  _CourseCard(
                    className: "Mã lớp: C001",
                    tag: "MẤT GỐC",
                    teacher: "Nguyễn C",
                    students: 24,
                    revenue: "12.720.000",
                    cardColor: Color(0xFFE57373), // Đỏ cam
                    tagColor: Colors.deepOrange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// WIDGET 1: HEADER CỦA TỪNG MÔN HỌC
// ==========================================
class _SubjectSection extends StatelessWidget {
  final String subjectName;
  final IconData icon;
  final List<Widget> children;

  const _SubjectSection({
    required this.subjectName,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 8),
            Text(
              subjectName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Horizontal Scroll View
        SizedBox(
          height: 190, // Chiều cao cố định cho vùng scroll ngang
          child: ListView.separated(
            scrollDirection: Axis.horizontal, // Kéo ngang
            itemCount: children.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) => children[index],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// WIDGET 2: THẺ KHÓA HỌC (CARD)
// ==========================================
class _CourseCard extends StatelessWidget {
  final String className;
  final String tag;
  final String teacher;
  final int students;
  final String revenue;
  final Color cardColor;
  final Color tagColor;

  const _CourseCard({
    required this.className,
    required this.tag,
    required this.teacher,
    required this.students,
    required this.revenue,
    required this.cardColor,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    // Dùng Stack để đè nút Xóa lên trên Card
    return Stack(
      children: [
        // 1. Phần nội dung Card
        Container(
          width: 280, // Chiều rộng cố định của card
          margin: const EdgeInsets.only(
            top: 10,
            right: 10,
          ), // Chừa chỗ cho nút xóa
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tag & Mã lớp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Text(
                    className,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Thông tin giảng viên
              Text(
                "Giảng viên: $teacher",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),

              // Số học viên
              Text(
                "Tổng số học viên: $students",
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 5),

              // Doanh thu
              Text(
                "Doanh thu hiện tại: $revenue",
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),

        // 2. Nút Xóa (Dấu trừ màu đỏ) - Positioned
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // Xử lý sự kiện xóa tại đây
              print("Delete course $className");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.remove, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
