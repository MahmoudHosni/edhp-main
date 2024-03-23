
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';

abstract class MedicalEventStates {}

class LoadingMedicalEvents extends MedicalEventStates{}

class ErrorMedicalEvents extends MedicalEventStates{}

class ShowMedicalEvents extends MedicalEventStates{
   final List<MedicalEvent> medicalEvents;

   ShowMedicalEvents({required this.medicalEvents});
}

class ShowMedicalCenterBranch extends MedicalEventStates{
   final List<MedicalCenterBranchEntity> medicalCenters;

   ShowMedicalCenterBranch({required this.medicalCenters});
}