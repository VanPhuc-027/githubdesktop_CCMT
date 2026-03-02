import 'package:flutter/material.dart';

class SubjectDetailScreen extends StatelessWidget {
  final String code;
  final String name;
  final int credit;

  const SubjectDetailScreen({
    super.key,
    required this.code,
    required this.name,
    required this.credit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết môn học"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(Icons.code),
                    const SizedBox(width: 10),
                    Text(
                      "Mã môn: $code",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const Icon(Icons.school),
                    const SizedBox(width: 10),
                    Text(
                      "Số tín chỉ: $credit",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Quay lại"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}