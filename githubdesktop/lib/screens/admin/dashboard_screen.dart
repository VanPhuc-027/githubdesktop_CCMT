import 'package:flutter/material.dart';

// Import 4 màn hình bạn vừa tạo ở bước trước
// (Lưu ý kiểm tra lại đường dẫn import và tên class cho khớp với code của bạn nhé)
import 'courses_screen.dart';
import 'users_screen.dart';
import 'analyst_screen.dart';
import 'setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Danh sách 5 màn hình tương ứng với 5 tab ở BottomNavigationBar
  final List<Widget> _screens = [
    // Tab 0: Nội dung Home (đã cập nhật)
    const _DashboardHomeContent(),

    // Tab 1 -> 4: Gọi các screen bạn vừa tạo
    const CoursesScreen(),
    const UsersScreen(),
    const AnalystScreen(),
    const SettingScreen(),
  ];

  // Hàm xử lý khi người dùng nhấn vào các icon trên thanh điều hướng
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Phần thân sẽ thay đổi tùy thuộc vào _selectedIndex
      body: _screens[_selectedIndex],

      // Thanh điều hướng bên dưới
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Bắt buộc khi có > 3 item
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber[700], // Màu vàng cam khi chọn
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analyst',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// NỘI DUNG CHÍNH CỦA TAB HOME
// ==========================================
class _DashboardHomeContent extends StatelessWidget {
  const _DashboardHomeContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Header: Admin Dashboard ---
            const Row(
              children: [
                Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "Admin Dashboard",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- 2. Phần Tổng Quan (Grid 4 ô màu) ---
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.3,
              children: const [
                _StatCard(
                  title: "Tổng số học viên",
                  value: "1.784",
                  color: Color(0xFF80E8E3),
                ),
                _StatCard(
                  title: "Tổng số giảng viên",
                  value: "98",
                  color: Color(0xFFC7E68F),
                ),
                _StatCard(
                  title: "Tổng số khóa học",
                  value: "267",
                  color: Color(0xFF9A91E8),
                ),
                _StatCard(
                  title: "Tổng lượt truy cập",
                  value: "11.111",
                  color: Color(0xFFE685C3),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // --- 3. Header: Thống kê ---
            const Row(
              children: [
                Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "Thống kê",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- 4. Danh sách Thống kê Tài chính (List dọc) ---
            const _FinanceCard(
              icon: Icons.savings_outlined,
              title: "Doanh thu",
              value: "974 triệu vnđ",
              subtitle: "+12,54% so với năm 2024",
            ),
            const SizedBox(height: 15),
            const _FinanceCard(
              icon: Icons.school_outlined,
              title: "Tỉ lệ tốt nghiệp",
              value: "96% tốt nghiệp",
              subtitle: "+10,54% so với năm 2024",
            ),
            const SizedBox(height: 15),
            const _FinanceCard(
              icon: Icons.person_pin_outlined,
              title: "Chất lượng GV",
              value: "1224 đánh giá tốt",
              subtitle: "+8,14% so với năm 2024",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// WIDGET CON CHO PHẦN GRID (4 Ô MÀU)
// ==========================================
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// WIDGET CON CHO PHẦN THỐNG KÊ (HÀNG NGANG)
// ==========================================
class _FinanceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;

  const _FinanceCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFF2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, size: 60, color: Colors.black),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
