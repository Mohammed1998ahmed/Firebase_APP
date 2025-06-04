import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

ListView details_data(List<QueryDocumentSnapshot<Object?>> docs) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: docs.length,
    itemBuilder: (context, index) {
      final data = docs[index].data() as Map<String, dynamic>;
      final name = data['name'] ?? '';
      final intakeType = data['intakeType'] ?? '';
      final dosePerDay = data['dosePerDay'] ?? 1;
      final quantity = data['quantityPerDose'] ?? 1;
      final List<dynamic> times = data['doseTimes'] ?? [];
      final startDate = data['startDate'] ?? '';
      final endDate = data['endDate'] ?? '';

      return Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.medication, color: Colors.blue.shade800),
                  const SizedBox(width: 8),
                  Container(
                    width: 300.w,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text('طريقة التناول: $intakeType'),
              Text('عدد الجرعات: $dosePerDay في اليوم'),
              Text('الكمية في كل جرعة: $quantity'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: times.map<Widget>((t) {
                  return Chip(
                    label: Text(
                      t.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue.shade800,
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              Text(
                'الفترة: ${DateFormat('yyyy/MM/dd').format(DateTime.parse(startDate))} - ${DateFormat('yyyy/MM/dd').format(DateTime.parse(endDate))}',
              ),
            ],
          ),
        ),
      );
    },
  );
}
