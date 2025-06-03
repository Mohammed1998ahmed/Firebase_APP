import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_app/feature/add_medication/logic/cubit/add_medication_cubit.dart';
import 'package:firebase_app/notify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/widght/buildinputField.dart';
import '../../core/widght/sectionTitle.dart';
import 'ui/app_BarWidght.dart';
import 'ui/buildDatePicker.dart';
import 'ui/buildDropdown.dart';
import 'ui/buildTimePicker.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  Color get primaryColor => Colors.blue.shade800;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMedicationCubit, AddMedicationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubti = AddMedicationCubit.getObject(context);

        return Scaffold(
          appBar: appBarWidght(),
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: cubti.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('معلومات الدواء'),
                  buildInputField(
                    controller: cubti.nameCtrl,
                    label: 'اسم الدواء',
                    icon: Icons.medical_services,
                    validator: (v) =>
                        v!.isEmpty ? 'الرجاء إدخال اسم الدواء' : null,
                  ),
                  buildDropdown(
                    label: 'طريقة التناول',
                    icon: Icons.local_pharmacy,
                    value: cubti.intakeType,
                    items: cubti.intakeTypes,
                    onChanged: (val) {
                      cubti.change_intaketype(intakeType: val!);
                    },
                  ),
                  SizedBox(height: 24),
                  sectionTitle('جدولة الجرعات'),
                  buildDropdown(
                    label: 'عدد الجرعات يوميًا',
                    icon: Icons.repeat,
                    value: '${cubti.dosePerDay}',
                    items: List.generate(6, (i) => '${i + 1}'),
                    onChanged: (val) {
                      int v = int.parse(val!);
                      cubti.change_dosePerDay(dosePerDay: v);
                      // setState(() {
                      //   cubti.dosePerDay = v;
                      //   if (cubti.doseTimes.length < v) {
                      //     cubti.doseTimes.addAll(List.generate(
                      //         v - cubti.doseTimes.length,
                      //         (_) => TimeOfDay(hour: 8, minute: 0)));
                      //   } else if (cubti.doseTimes.length > v) {
                      //     cubti.doseTimes = cubti.doseTimes.sublist(0, v);
                      //   }
                      // });
                    },
                  ),
                  ...cubti.doseTimes.asMap().entries.map((e) {
                    int idx = e.key;
                    TimeOfDay time = e.value;
                    return buildTimePicker(
                      label: 'وقت الجرعة ${idx + 1}',
                      time: time,
                      onTap: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        if (picked != null)
                          setState(() => cubti.doseTimes[idx] = picked);
                      },
                      context: context,
                    );
                  }),
                  buildDropdown(
                    label: 'كمية الجرعة',
                    icon: Icons.confirmation_num,
                    value: '${cubti.quantityPerDose}',
                    items: List.generate(5, (i) => '${i + 1}'),
                    suffix: cubti.intakeType == 'شراب' ? 'مل' : 'قرص',
                    onChanged: (val) =>
                        setState(() => cubti.quantityPerDose = int.parse(val!)),
                  ),
                  SizedBox(height: 24),
                  sectionTitle('المدة'),
                  buildDatePicker(
                    label: 'تاريخ البداية',
                    date: cubti.startDate,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: cubti.startDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (picked != null)
                        setState(() => cubti.startDate = picked);
                    },
                  ),
                  buildDatePicker(
                    label: 'تاريخ الانتهاء',
                    date: cubti.endDate,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: cubti.endDate,
                        firstDate: cubti.startDate,
                        lastDate: DateTime.now().add(Duration(days: 730)),
                      );
                      if (picked != null)
                        setState(() => cubti.endDate = picked);
                    },
                  ),
                  SizedBox(height: 24),
                  sectionTitle('ملاحظات'),
                  buildInputField(
                    controller: cubti.notesCtrl,
                    label: 'ملاحظات الطبيب (اختياري)',
                    icon: Icons.note,
                    maxLines: 3,
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (cubti.formKey.currentState?.validate() ?? false) {
                          // TODO: save to Firebase
                          try {
                            if (user == null) {
                              // لم يتم تسجيل الدخول
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('تسجيل الدخول مطلوب'),
                                  content: Text(
                                      'يرجى تسجيل الدخول أولاً لإضافة دواء.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.login_page);
                                      },
                                      child: Text('تسجيل الدخول'),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              // السماح بإضافة الدواء وربط user.uid مثلاً

                              final data = {
                                'name': cubti.nameCtrl.text.trim(),
                                'notes': cubti.notesCtrl.text.trim(),
                                'intakeType': cubti.intakeType,
                                'dosePerDay': cubti.dosePerDay,
                                'quantityPerDose': cubti.quantityPerDose,
                                'doseTimes': cubti.doseTimes
                                    .map((t) =>
                                        '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}')
                                    .toList(),
                                'startDate': DateFormat('yyyy-MM-dd')
                                    .format(cubti.startDate),
                                'endDate': DateFormat('yyyy-MM-dd')
                                    .format(cubti.endDate),
                                'userId': user!.uid,
                                'createdAt': FieldValue.serverTimestamp(),
                              };
                              await FirebaseFirestore.instance
                                  .collection('medications')
                                  .add(data);
                              await Notify
                                  .scheduleAllNotificationsFromFirebase();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('تم حفظ الدواء في Firebase')),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('تم حفظ الدواء بنجاح!')),
                              );
                            }

                            // Navigator.pop(context); // الرجوع بعد الحفظ
                          } catch (e) {
                            print('خطأ أثناء الحفظ: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('حدث خطأ أثناء الحفظ')),
                            );
                          }

                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(Icons.save),
                      label: Text('حفظ الدواء'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
