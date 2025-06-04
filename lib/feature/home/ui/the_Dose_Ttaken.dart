import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class the_Dose_Ttaken extends StatelessWidget {
  const the_Dose_Ttaken({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return user != null
        ? StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('medications')
                .where('userId', isEqualTo: user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("لا توجد جرعات منتهية."));
              }

              final now = DateTime.now();
              List<Widget> expiredDoseWidgets = [];

              for (var doc in snapshot.data!.docs) {
                final data = doc.data() as Map<String, dynamic>;

                final String medicineName = data['name'] ?? 'دواء';
                final List<dynamic> doseTimes = data['doseTimes'] ?? [];
                final String startDateStr = data['startDate'] ?? '';
                final String endDateStr = data['endDate'] ?? '';
                final String intakeType = data['intakeType'] ?? '';
                final String notes = data['notes'] ?? '';
                final int quantityPerDose = data['quantityPerDose'] ?? 1;
                final int dosePerDay = data['dosePerDay'] ?? 1;

                if (startDateStr.isEmpty || doseTimes.isEmpty) continue;

                final startDate = DateTime.tryParse(startDateStr);
                final endDate = DateTime.tryParse(endDateStr);

                if (startDate == null || endDate == null) continue;

                // المرور على كل يوم من فترة الدواء
                for (var day = startDate;
                    day.isBefore(endDate.add(const Duration(days: 1)));
                    day = day.add(const Duration(days: 1))) {
                  for (var timeStr in doseTimes) {
                    final parts = timeStr.split(':');
                    if (parts.length != 2) continue;

                    final hour = int.tryParse(parts[0]) ?? 0;
                    final minute = int.tryParse(parts[1]) ?? 0;
                    final doseTime =
                        DateTime(day.year, day.month, day.day, hour, minute);

                    if (doseTime.isBefore(now)) {
                      // تنسيق الوقت
                      final timeOfDay = TimeOfDay.fromDateTime(doseTime);
                      final period =
                          timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
                      final formattedHour = timeOfDay.hourOfPeriod == 0
                          ? 12
                          : timeOfDay.hourOfPeriod;
                      final formattedMinute =
                          timeOfDay.minute.toString().padLeft(2, '0');
                      final displayTime =
                          "$formattedHour:$formattedMinute $period";

                      expiredDoseWidgets.add(
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 10),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green, size: 30),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 180.w,
                                    child: Text(
                                      medicineName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueGrey[800],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    displayTime,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('عدد الجرعات اليومية: $dosePerDay'),
                              const Divider(height: 24),
                              _infoRow(
                                  'الكمية', '$quantityPerDose $intakeType'),
                              _infoRow(
                                  'التاريخ', '${day.toString().split(' ')[0]}'),
                              _infoRow('ملاحظات الطبيب',
                                  notes.isNotEmpty ? notes : 'لا توجد'),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                }
              }

              if (expiredDoseWidgets.isEmpty) {
                return const Center(
                    child: Text("لا توجد جرعات منتهية حتى الآن."));
              }

              return Container(
                width: 420.w,
                height: 400.h,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: expiredDoseWidgets,
                ),
              );
            },
          )
        : Center(child: Text("لا توجد جرعات منتهية."));
  }

// دالة مساعدة لعرض سطر معلومة
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
