part of 'add_medication_cubit.dart';

@immutable
sealed class AddMedicationState {}

final class AddMedicationInitial extends AddMedicationState {}

final class AddMedication_intakeType extends AddMedicationState {}

final class AddMedication_dosePerDay extends AddMedicationState {}

final class AddMedication_doseTimes extends AddMedicationState {}
