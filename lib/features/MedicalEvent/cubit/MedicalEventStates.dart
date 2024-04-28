import 'package:edhp/models/AddMedicalSubscriptionResponse.dart';
import 'package:edhp/models/ConditionsAndDetails.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/MedicalEventService.dart';
import 'package:edhp/models/MedicalEventSubscriptionLookups.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:equatable/equatable.dart';

abstract class MedicalEventStates extends Equatable{
}

class LoadingMedicalEvents extends MedicalEventStates{
   @override
   List<Object> get props => [];
}

class ErrorMedicalEvents extends MedicalEventStates{
   @override
   List<Object> get props => [];
}

class ShowMedicalEvents extends MedicalEventStates{
   final List<MedicalEvent> medicalEvents;

   ShowMedicalEvents({required this.medicalEvents});

   @override
   List<Object> get props => medicalEvents;
}

class ShowMedicalCenterBranch extends MedicalEventStates{
   final List<MedicalCenterBranchEntity> medicalCenters;

   ShowMedicalCenterBranch({required this.medicalCenters});

   @override
   List<Object> get props => medicalCenters;
}

class ShowMedicalEventServices extends MedicalEventStates{
   final List<MedicalEventService> medicalEventServices;

   ShowMedicalEventServices({required this.medicalEventServices});

   @override
   List<Object> get props => medicalEventServices;
}

class ShowMedicalEventServiceLookups extends MedicalEventStates{
   final MedicalEventSubscriptionLookups medicalEventSubscriptionLookups;

   ShowMedicalEventServiceLookups({required this.medicalEventSubscriptionLookups});

   @override
   List<Object> get props => [];
}

class ShowMedicalCenterBranchWithLookups extends MedicalEventStates{
   final List<MedicalCenterBranchEntity> medicalCenters;
   final MedicalEventSubscriptionLookups medicalEventSubscriptionLookups;

   ShowMedicalCenterBranchWithLookups({required this.medicalCenters,required this.medicalEventSubscriptionLookups});

   @override
   List<Object> get props => [];
}

class MedicalSubscriptionResponse extends MedicalEventStates{
   final AddMedicalSubscriptionResponse response;

   MedicalSubscriptionResponse({required this.response});

   @override
   List<Object> get props => [];
}

class CancelMedicalSubscriptionResponse extends MedicalEventStates{
   final Result response;

   CancelMedicalSubscriptionResponse({required this.response});

   @override
   List<Object> get props => [];
}

class ConditionsAndDetailsResponse extends MedicalEventStates{
   final ConditionsAndDetails response;

   ConditionsAndDetailsResponse({required this.response});

   @override
   List<Object> get props => [];
}