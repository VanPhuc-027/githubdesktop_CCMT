import 'package:flutter/material.dart';

class Subject {
  final String code;
  final String name;
  final int credit;

  Subject({
    required this.code,
    required this.name,
    required this.credit,
  });
}

class SubjectListScreen extends StatelessWidget {
  SubjectListScreen({super.key});

  final List<Subject> subjects = [
    Subject(code: "INT101", name: "Lập trình Java", credit: 3),
    Subject(code: "WEB202", name: "Phát triển Web", credit: 3),
    Subject(code: "DB303", name: "Cơ sở dữ liệu", credit: 2),
    Subject(code: "MOB404", name: "Lập trình Flutter", credit: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách môn học"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(subject.credit.toString()),
              ),
              title: Text(
                subject.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Mã môn: ${subject.code}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Bạn chọn ${subject.name}"),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Chức năng thêm môn học"),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}