import 'package:edhp/models/Governorate.dart';
import 'package:edhp/models/ServiceProvider.dart';
import 'package:edhp/models/ServiceProviderType.dart';

class MedicalEventSubscriptionLookups{
  List<Governorate>? governorates = [];
  List<ServiceProvider>? serviceProviders = [];
  List<ServiceProviderType>? serviceProviderType = [];

  MedicalEventSubscriptionLookups({required this.governorates,required this.serviceProviders,required this.serviceProviderType});

  MedicalEventSubscriptionLookups.fromJson(Map<String, dynamic> json) {
    json['Governorates'].forEach((element) {
      governorates?.add(Governorate.fromJson(element));
    });

    json['ServiceProviders'].forEach((element) {
      serviceProviders?.add(ServiceProvider.fromJson(element));
    });

    json['ServiceProviderTypes'].forEach((element) {
      serviceProviderType?.add(ServiceProviderType.fromJson(element));
    });

  }
}