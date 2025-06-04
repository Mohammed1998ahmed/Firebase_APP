import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widght/Spacer.dart';

class next_Dose extends StatelessWidget {
  const next_Dose({
    super.key,
  });

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
                return const Center(child: Text("لا توجد بيانات حالياً"));
              }

              final now = DateTime.now();
              DateTime? closestTime;
              Map<String, dynamic>? closestData;

              for (var doc in snapshot.data!.docs) {
                final data = doc.data() as Map<String, dynamic>;
                final String startDate = data['startDate'] ?? '';
                final List<dynamic> times = data['doseTimes'] ?? [];

                if (startDate.isEmpty || times.isEmpty) continue;

                final dateParts = startDate.split('-'); // مثال: 2025-06-01
                final year = int.tryParse(dateParts[0]) ?? 0;
                final month = int.tryParse(dateParts[1]) ?? 1;
                final day = int.tryParse(dateParts[2]) ?? 1;

                for (var timeStr in times) {
                  final timeParts = timeStr.split(':');
                  final hour = int.tryParse(timeParts[0]) ?? 0;
                  final minute = int.tryParse(timeParts[1]) ?? 0;

                  final dateTime = DateTime(year, month, day, hour, minute);

                  if (dateTime.isAfter(now)) {
                    if (closestTime == null || dateTime.isBefore(closestTime)) {
                      closestTime = dateTime;
                      closestData = data;
                    }
                  }
                }
              }

              if (closestTime == null || closestData == null) {
                return const Center(child: Text("لا توجد مواعيد قادمة"));
              }

              // تنسيق الوقت للعرض
              final timeOfDay = TimeOfDay.fromDateTime(closestTime);
              final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
              final formattedHour =
                  timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
              final formattedMinute =
                  timeOfDay.minute.toString().padLeft(2, '0');
              final displayTime = "$formattedHour:$formattedMinute $period";

              final String medicineName = closestData['name'] ?? 'جرعة قادمة';
              final String displayDate =
                  closestTime.toString().split(" ").first;

              return Container(
                width: 400.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: ColorsApp.sax_Color_Blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SpacerWidght(width: 20.w),
                    Icon(
                      Icons.notifications_active,
                      size: 60.dg,
                      color: ColorsApp.three_Color_Blue,
                    ),
                    SpacerWidght(width: 30.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          child: Text(
                            medicineName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorsApp.main_Color_Black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                        Text(
                          displayDate,
                          style: TextStyle(
                            color: ColorsApp.main_Color_Black,
                            fontWeight: FontWeight.w300,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    SpacerWidght(width: 20.w),
                    Text(
                      displayTime,
                      style: TextStyle(
                        color: ColorsApp.main_Color_Black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : Center(child: Text("لا توجد بيانات حالياً"));
  }
}
