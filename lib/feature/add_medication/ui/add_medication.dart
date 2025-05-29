// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AddMedicationScreen extends StatefulWidget {
//   const AddMedicationScreen({super.key});

//   @override
//   State<AddMedicationScreen> createState() => _AddMedicationScreenState();
// }

// class _AddMedicationScreenState extends State<AddMedicationScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController notesController = TextEditingController();

//   TimeOfDay selectedTime = TimeOfDay(hour: 8, minute: 0);
//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now().add(const Duration(days: 7));
//   int dosePerDay = 1;
//   String intakeType = 'قرص';

//   final List<String> intakeTypes = ['قرص', 'شراب', 'قطرة', 'حقنة'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9FAFB),
//       appBar: AppBar(
//         title: const Text('إضافة دواء'),
//         centerTitle: true,
//         backgroundColor: Colors.blue[700],
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // اسم الدواء
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'اسم الدواء',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) => value == null || value.isEmpty
//                     ? 'يرجى إدخال اسم الدواء'
//                     : null,
//               ),
//               const SizedBox(height: 16),

//               // وقت التناول
//               ListTile(
//                 leading: const Icon(Icons.access_time),
//                 title: Text('وقت التناول: ${selectedTime.format(context)}'),
//                 onTap: () async {
//                   final time = await showTimePicker(
//                     context: context,
//                     initialTime: selectedTime,
//                   );
//                   if (time != null) {
//                     setState(() => selectedTime = time);
//                   }
//                 },
//               ),

//               // عدد الجرعات
//               ListTile(
//                 leading: const Icon(Icons.repeat),
//                 title: Row(
//                   children: [
//                     const Text('عدد الجرعات في اليوم: '),
//                     const SizedBox(width: 10),
//                     DropdownButton<int>(
//                       value: dosePerDay,
//                       onChanged: (val) => setState(() => dosePerDay = val!),
//                       items: List.generate(
//                         6,
//                         (index) => DropdownMenuItem(
//                           value: index + 1,
//                           child: Text('${index + 1} مرة'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // طريقة التناول
//               ListTile(
//                 leading: const Icon(Icons.local_pharmacy),
//                 title: Row(
//                   children: [
//                     const Text('طريقة التناول: '),
//                     const SizedBox(width: 10),
//                     DropdownButton<String>(
//                       value: intakeType,
//                       onChanged: (val) => setState(() => intakeType = val!),
//                       items: intakeTypes
//                           .map((type) => DropdownMenuItem(
//                                 value: type,
//                                 child: Text(type),
//                               ))
//                           .toList(),
//                     ),
//                   ],
//                 ),
//               ),

//               // تاريخ البدء والانتهاء
//               ListTile(
//                 leading: const Icon(Icons.date_range),
//                 title: Text(
//                     'تاريخ البدء: ${DateFormat('yyyy/MM/dd').format(startDate)}'),
//                 onTap: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: startDate,
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime.now().add(const Duration(days: 365)),
//                   );
//                   if (date != null) setState(() => startDate = date);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.event_available),
//                 title: Text(
//                     'تاريخ الانتهاء: ${DateFormat('yyyy/MM/dd').format(endDate)}'),
//                 onTap: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: endDate,
//                     firstDate: startDate,
//                     lastDate: DateTime.now().add(const Duration(days: 730)),
//                   );
//                   if (date != null) setState(() => endDate = date);
//                 },
//               ),

//               // ملاحظات الطبيب
//               TextFormField(
//                 controller: notesController,
//                 decoration: const InputDecoration(
//                   labelText: 'ملاحظات الطبيب (اختياري)',
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 2,
//               ),
//               const SizedBox(height: 24),

//               // زر حفظ
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   icon: const Icon(Icons.save),
//                   label: const Text('حفظ الدواء'),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     backgroundColor: Colors.blue[700],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     textStyle: const TextStyle(fontSize: 16),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // هنا يتم حفظ الدواء في Firebase مثلاً
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('تم حفظ الدواء بنجاح')),
//                       );
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay(hour: 8, minute: 0);
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 7));
  int dosePerDay = 1;
  String intakeType = 'قرص';

  final List<String> intakeTypes = ['قرص', 'شراب', 'قطرة', 'حقنة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: AppBar(
        title: const Text('إضافة دواء'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildCard(
                child: TextFormField(
                  controller: nameController,
                  decoration: _inputDecoration('اسم الدواء'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'يرجى إدخال اسم الدواء'
                      : null,
                ),
              ),

              _buildCard(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text(
                    'وقت التناول: ${selectedTime.format(context)}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (time != null) setState(() => selectedTime = time);
                  },
                ),
              ),

              _buildCard(
                child: ListTile(
                  leading: const Icon(Icons.repeat),
                  title: Row(
                    children: [
                      const Text('عدد الجرعات: '),
                      const SizedBox(width: 10),
                      DropdownButton<int>(
                        value: dosePerDay,
                        onChanged: (val) => setState(() => dosePerDay = val!),
                        items: List.generate(
                          6,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text('${index + 1} مرة'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _buildCard(
                child: ListTile(
                  leading: const Icon(Icons.medication_liquid),
                  title: Row(
                    children: [
                      const Text('طريقة التناول: '),
                      const SizedBox(width: 10),
                      DropdownButton<String>(
                        value: intakeType,
                        onChanged: (val) => setState(() => intakeType = val!),
                        items: intakeTypes
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),

              _buildCard(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(
                        'تاريخ البدء: ${DateFormat('yyyy/MM/dd').format(startDate)}',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) setState(() => startDate = date);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.event_available),
                      title: Text(
                        'تاريخ الانتهاء: ${DateFormat('yyyy/MM/dd').format(endDate)}',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: endDate,
                          firstDate: startDate,
                          lastDate:
                              DateTime.now().add(const Duration(days: 730)),
                        );
                        if (date != null) setState(() => endDate = date);
                      },
                    ),
                  ],
                ),
              ),

              _buildCard(
                child: TextFormField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: _inputDecoration('ملاحظات الطبيب'),
                ),
              ),

              const SizedBox(height: 30),

              // زر الحفظ
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('حفظ الدواء'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم حفظ الدواء بنجاح')),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // تنسيق بطاقة
  Widget _buildCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: child,
    );
  }

  // ديكور الحقول
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      border: InputBorder.none,
    );
  }
}
