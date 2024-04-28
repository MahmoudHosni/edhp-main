

class MedicalSubscriptionState {
  int ID=0;
  int MedicalEventID=0;
  int ServiceID=0;
  int ServiceProviderBranchID=0;

  MedicalSubscriptionState({required this.ID,required this.MedicalEventID,required this.ServiceID,required this.ServiceProviderBranchID});

  MedicalSubscriptionState.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    MedicalEventID = json['MedicalEventID'];
    ServiceID = json['ServiceID'];
    ServiceProviderBranchID = json['ServiceProviderBranchID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = ID;
    data['MedicalEventID'] = MedicalEventID;
    data['ServiceID'] = ServiceID;
    data['ServiceProviderBranchID'] = ServiceProviderBranchID;
    return data;
  }
}