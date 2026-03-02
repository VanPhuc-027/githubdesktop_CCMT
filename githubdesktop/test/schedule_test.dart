import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_name/exam_schedule_screen.dart';
import 'package:your_project_name/study_schedule_screen.dart';

void main() {

  group('ExamScheduleScreen Test', () {

    testWidgets('Hiển thị đúng tiêu đề và danh sách môn thi',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: ExamScheduleScreen(),
        ),
      );

      // Kiểm tra AppBar title
      expect(find.text('Lịch Thi'), findsOneWidget);

      // Kiểm tra dữ liệu exam
      expect(find.text('Cơ sở lập trình'), findsOneWidget);
      expect(find.text('Cơ sở dự liệu'), findsOneWidget);

      // Kiểm tra có BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });


  group('StudyScheduleScreen Test', () {

    testWidgets('Hiển thị lịch học và danh sách lớp',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: StudyScheduleScreen(),
        ),
      );

      // Kiểm tra AppBar title
      expect(find.text('Lịch học'), findsOneWidget);

      // Kiểm tra tiêu đề phần lớp học
      expect(find.text('Lớp học hôm nay'), findsOneWidget);

      // Kiểm tra các môn học
      expect(find.text('Java Web'), findsOneWidget);
      expect(find.text('Giải Tích 1'), findsOneWidget);
      expect(find.text('Tiếng Anh 1'), findsOneWidget);

      // Kiểm tra calendar tháng
      expect(find.text('Tháng 2'), findsOneWidget);

      // Kiểm tra BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });

}