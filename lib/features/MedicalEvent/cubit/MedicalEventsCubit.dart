import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/models/AddMedicalSubscriptionResponse.dart';
import 'package:edhp/models/ConditionsAndDetails.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/MedicalEventService.dart';
import 'package:edhp/models/MedicalEventSubscriptionLookups.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalEventsCubit extends Cubit<MedicalEventStates>{
  MedicalEventsCubit() : super(LoadingMedicalEvents());

  static MedicalEventsCubit get(BuildContext context) => BlocProvider.of(context);

  Future getEvents()async{
    emit(LoadingMedicalEvents());
    await DioHelper.getData(
      path: EndPoint.GetMedicalEvents ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<MedicalEvent> medicalEvents = [];
      value.data.forEach((element) {
        medicalEvents?.add(MedicalEvent.fromJson(element));
      });
      emit(ShowMedicalEvents(medicalEvents: medicalEvents));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  Future getEventServiceProvidersBranches(int centerID,int eventID,{String? governorateID='',String? serviceProviderID='',String? serviceProviderTypeID=''})async{
    emit(LoadingMedicalEvents());
    await DioHelper.getData(
      path: "${EndPoint.GetEventServiceProvidersBranches}&medicalEventId=$eventID&serviceID=$centerID&stateID=$governorateID&serviceProviderID=$serviceProviderID&serviceProviderTypeID=$serviceProviderTypeID" ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<MedicalCenterBranchEntity> medicalCenters = [];
      value.data.forEach((element) {
        medicalCenters?.add(MedicalCenterBranchEntity.fromJson(element));
      });
      GetMedicalEventSubscriptionLookups(centerID,eventID,medicalCenters);
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  Future GetMedicalEventServices(int eventID)async{
    emit(LoadingMedicalEvents());
    await DioHelper.getData(
      path: EndPoint.GetMedicalEventServices+eventID.toString() ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<MedicalEventService> medicalServices = [];
      value.data.forEach((element) {
        medicalServices?.add(MedicalEventService.fromJson(element));
      });
      emit(ShowMedicalEventServices(medicalEventServices: medicalServices));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  Future GetMedicalEventSubscriptionLookups(int centerID,int eventID,List<MedicalCenterBranchEntity> lst) async{
    await DioHelper.getData(
      path: "${EndPoint.GetMedicalEventSubscriptionLookups}medicalEventID=$eventID&serviceID=$centerID" ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      MedicalEventSubscriptionLookups medicalEventSubscriptionLookups =MedicalEventSubscriptionLookups.fromJson(value.data);
      emit(ShowMedicalCenterBranchWithLookups(medicalEventSubscriptionLookups: medicalEventSubscriptionLookups,medicalCenters: lst));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  Future addMedicalEventSubscription(int eventID,int serviceID,int branchID) async{
    await DioHelper.postData(
      path: EndPoint.AddMedicalEventSubscription,
      data: {
        "MedicalEventID": eventID,
        "ServiceProviderBranchID": branchID,
        "ServiceID": serviceID,
      },
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      AddMedicalSubscriptionResponse response = AddMedicalSubscriptionResponse.fromJson(value.data);
      emit(MedicalSubscriptionResponse(response: response));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  //Result
  Future cancelMedicalEventSubscription(int eventID) async{
    await DioHelper.deleteData(
      path: EndPoint.CancelMedicalEventSubscription+eventID.toString(),
      data: {
        "MedicalEventID": eventID,
      },
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      Result response = Result.fromJson(value.data);
      emit(CancelMedicalSubscriptionResponse(response: response));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }

  //ConditionsAndDetails
  Future getConditionsAndDetailsOfEvent(int eventID) async{
    await DioHelper.getData(
      path: EndPoint.DetailsAndConditionsOfEvent+eventID.toString(),
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      ConditionsAndDetails response = ConditionsAndDetails.fromJson(value.data);
      emit(ConditionsAndDetailsResponse(response: response));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }
}