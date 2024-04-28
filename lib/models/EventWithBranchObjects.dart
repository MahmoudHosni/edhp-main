import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/MedicalEventService.dart';

class EventWithBranchObjects {
  final MedicalEventService medicalEventService;
  final MedicalEvent medicalEvent;

  EventWithBranchObjects({required this.medicalEvent,required this.medicalEventService});
}