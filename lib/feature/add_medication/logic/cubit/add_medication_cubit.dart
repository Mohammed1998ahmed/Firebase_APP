import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_medication_state.dart';

class AddMedicationCubit extends Cubit<AddMedicationState> {
  AddMedicationCubit() : super(AddMedicationInitial());
  static AddMedicationCubit getObject(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController notesCtrl = TextEditingController();

  List<TimeOfDay> doseTimes = [TimeOfDay(hour: 8, minute: 0)];
  int dosePerDay = 1;
  int quantityPerDose = 1;
  String intakeType = 'قرص';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 7));
  final List<String> intakeTypes = ['قرص', 'شراب', 'قطرة', 'حقنة'];

  void change_intaketype({required String intakeType}) {
    this.intakeType = intakeType;
    emit(AddMedication_intakeType());
  }

  void change_dosePerDay({required int dosePerDay}) {
    this.dosePerDay = dosePerDay;
    if (doseTimes.length < dosePerDay) {
      doseTimes.addAll(List.generate(
          dosePerDay - doseTimes.length, (_) => TimeOfDay(hour: 8, minute: 0)));
    } else if (doseTimes.length > dosePerDay) {
      doseTimes = doseTimes.sublist(0, dosePerDay);
    }
    emit(AddMedication_dosePerDay());
  }

  void change_doseTimes({required List<TimeOfDay> doseTimes}) {
    this.doseTimes = doseTimes;
    emit(AddMedication_doseTimes());
  }
}
