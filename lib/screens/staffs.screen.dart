import 'package:dailyboxoffice/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class StaffsScreen extends StatelessWidget {
  const StaffsScreen({Key? key, required this.staffs}) : super(key: key);
  final List<Staffs> staffs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        title: const Text(
          "스태프",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            var staff = staffs[index];
            return Center(
              child: Text(
                '${staff.peopleNm} / ${staff.staffRoleNm}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: staffs.length),
    );
  }
}
