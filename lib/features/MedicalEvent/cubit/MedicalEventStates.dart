
import 'package:edhp/models/MedicalEvent.dart';

abstract class MedicalEventStates {}

class LoadingMedicalEvents extends MedicalEventStates{}

class ErrorMedicalEvents extends MedicalEventStates{}

class ShowMedicalEvents extends MedicalEventStates{
   final List<MedicalEvent> medicalEvents;

   ShowMedicalEvents({required this.medicalEvents});
}