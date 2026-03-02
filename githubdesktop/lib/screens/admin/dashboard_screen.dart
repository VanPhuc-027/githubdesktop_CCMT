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
    // Tab 0: Nội dung Home (Tạm thời để chữ rỗng, commit sau mình sẽ đắp UI thật vào)
    const Center(
      child: Text(
        'Đây sẽ là nội dung của Admin Home (Grid, Doanh thu...)',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),

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
