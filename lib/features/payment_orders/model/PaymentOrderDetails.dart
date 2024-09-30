

class PaymentOrderDetails {
  int? iD;
  bool? isActive;
  int? saasProfileId;
  String? creationTime;
  int? createdBy;
  String? modificationTime;
  int? modifiedBy;
  bool? isDeleted;
  String? deleteTime;
  int? deletedBy;
  int? spSubsciptionRequestID;
  double? actualPrice;
  int? profitMargin;
  int? serviceProviderServiceID;
  // ServiceProviderService? serviceProviderService;
  String? serviceName;
  String? serviceDescription;
  double? contractPrice;
  double? normalPrice;

  PaymentOrderDetails(
      {this.iD,
        this.isActive,
        this.saasProfileId,
        this.creationTime,
        this.createdBy,
        this.modificationTime,
        this.modifiedBy,
        this.isDeleted,
        this.deleteTime,
        this.deletedBy,
        this.spSubsciptionRequestID,
        this.actualPrice,
        this.profitMargin,
        this.serviceProviderServiceID,
        // this.serviceProviderService,
        this.serviceName,
        this.serviceDescription,
        this.contractPrice,
        this.normalPrice});

  PaymentOrderDetails.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    isActive = json['IsActive'];
    saasProfileId = json['SaasProfileId'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    modificationTime = json['ModificationTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    deleteTime = json['DeleteTime'];
    deletedBy = json['DeletedBy'];
    spSubsciptionRequestID = json['SpSubsciptionRequestID'];
    actualPrice = json['ActualPrice'];
    profitMargin = json['ProfitMargin'];
    serviceProviderServiceID = json['ServiceProviderServiceID'];
    // serviceProviderService = json['ServiceProviderService'] != null
    //     ? new ServiceProviderService.fromJson(json['ServiceProviderService'])
    //     : null;
    serviceName = json['ServiceName'];
    serviceDescription = json['ServiceDescription'];
    contractPrice = json['ContractPrice'];
    normalPrice = json['NormalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IsActive'] = this.isActive;
    data['SaasProfileId'] = this.saasProfileId;
    data['CreationTime'] = this.creationTime;
    data['CreatedBy'] = this.createdBy;
    data['ModificationTime'] = this.modificationTime;
    data['ModifiedBy'] = this.modifiedBy;
    data['IsDeleted'] = this.isDeleted;
    data['DeleteTime'] = this.deleteTime;
    data['DeletedBy'] = this.deletedBy;
    data['SpSubsciptionRequestID'] = this.spSubsciptionRequestID;
    data['ActualPrice'] = this.actualPrice;
    data['ProfitMargin'] = this.profitMargin;
    data['ServiceProviderServiceID'] = this.serviceProviderServiceID;
    // if (this.serviceProviderService != null) {
    //   data['ServiceProviderService'] = this.serviceProviderService!.toJson();
    // }
    data['ServiceName'] = this.serviceName;
    data['ServiceDescription'] = this.serviceDescription;
    data['ContractPrice'] = this.contractPrice;
    data['NormalPrice'] = this.normalPrice;
    return data;
  }
}

// class ServiceProviderService {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   int? servicesID;
//   Service? service;
//   int? servicePorviderID;
//   ServicePorvider? servicePorvider;
//   int? contractPrice;
//   int? normalPrice;
//   String? serviceName;
//   String? serviceDescription;
//   int? serviceCategoryID;
//   int? serviceCategoryDetailsID;
//
//   ServiceProviderService(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.servicesID,
//         this.service,
//         this.servicePorviderID,
//         this.servicePorvider,
//         this.contractPrice,
//         this.normalPrice,
//         this.serviceName,
//         this.serviceDescription,
//         this.serviceCategoryID,
//         this.serviceCategoryDetailsID});
//
//   ServiceProviderService.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     servicesID = json['ServicesID'];
//     service =
//     json['Service'] != null ? new Service.fromJson(json['Service']) : null;
//     servicePorviderID = json['ServicePorviderID'];
//     servicePorvider = json['ServicePorvider'] != null
//         ? new ServicePorvider.fromJson(json['ServicePorvider'])
//         : null;
//     contractPrice = json['ContractPrice'];
//     normalPrice = json['NormalPrice'];
//     serviceName = json['ServiceName'];
//     serviceDescription = json['ServiceDescription'];
//     serviceCategoryID = json['ServiceCategoryID'];
//     serviceCategoryDetailsID = json['ServiceCategoryDetailsID'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['ServicesID'] = this.servicesID;
//     if (this.service != null) {
//       data['Service'] = this.service!.toJson();
//     }
//     data['ServicePorviderID'] = this.servicePorviderID;
//     if (this.servicePorvider != null) {
//       data['ServicePorvider'] = this.servicePorvider!.toJson();
//     }
//     data['ContractPrice'] = this.contractPrice;
//     data['NormalPrice'] = this.normalPrice;
//     data['ServiceName'] = this.serviceName;
//     data['ServiceDescription'] = this.serviceDescription;
//     data['ServiceCategoryID'] = this.serviceCategoryID;
//     data['ServiceCategoryDetailsID'] = this.serviceCategoryDetailsID;
//     return data;
//   }
// }

// class Service {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? servicePorviderTypeID;
//   ServicePorviderType? servicePorviderType;
//   int? serviceCategoryID;
//   ServiceCategory? serviceCategory;
//   int? serviceCatID;
//   ServiceCat? serviceCat;
//   int? serviceCategoryDetailsID;
//   ServiceCategoryDetails? serviceCategoryDetails;
//   int? servicePorviderID;
//   List<ServicePorviderBranchesService>? servicePorviderBranchesService;
//   List<String>? servicePorviderService;
//
//   Service(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.servicePorviderTypeID,
//         this.servicePorviderType,
//         this.serviceCategoryID,
//         this.serviceCategory,
//         this.serviceCatID,
//         this.serviceCat,
//         this.serviceCategoryDetailsID,
//         this.serviceCategoryDetails,
//         this.servicePorviderID,
//         this.servicePorviderBranchesService,
//         this.servicePorviderService});
//
//   Service.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     servicePorviderTypeID = json['ServicePorviderTypeID'];
//     servicePorviderType = json['ServicePorviderType'] != null
//         ? new ServicePorviderType.fromJson(json['ServicePorviderType'])
//         : null;
//     serviceCategoryID = json['ServiceCategoryID'];
//     serviceCategory = json['ServiceCategory'] != null
//         ? new ServiceCategory.fromJson(json['ServiceCategory'])
//         : null;
//     serviceCatID = json['ServiceCatID'];
//     serviceCat = json['ServiceCat'] != null
//         ? new ServiceCat.fromJson(json['ServiceCat'])
//         : null;
//     serviceCategoryDetailsID = json['ServiceCategoryDetailsID'];
//     serviceCategoryDetails = json['ServiceCategoryDetails'] != null
//         ? new ServiceCategoryDetails.fromJson(json['ServiceCategoryDetails'])
//         : null;
//     servicePorviderID = json['ServicePorviderID'];
//     if (json['ServicePorviderBranchesService'] != null) {
//       servicePorviderBranchesService = <ServicePorviderBranchesService>[];
//       json['ServicePorviderBranchesService'].forEach((v) {
//         servicePorviderBranchesService!
//             .add(new ServicePorviderBranchesService.fromJson(v));
//       });
//     }
//     servicePorviderService = json['ServicePorviderService'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServicePorviderTypeID'] = this.servicePorviderTypeID;
//     if (this.servicePorviderType != null) {
//       data['ServicePorviderType'] = this.servicePorviderType!.toJson();
//     }
//     data['ServiceCategoryID'] = this.serviceCategoryID;
//     if (this.serviceCategory != null) {
//       data['ServiceCategory'] = this.serviceCategory!.toJson();
//     }
//     data['ServiceCatID'] = this.serviceCatID;
//     if (this.serviceCat != null) {
//       data['ServiceCat'] = this.serviceCat!.toJson();
//     }
//     data['ServiceCategoryDetailsID'] = this.serviceCategoryDetailsID;
//     if (this.serviceCategoryDetails != null) {
//       data['ServiceCategoryDetails'] = this.serviceCategoryDetails!.toJson();
//     }
//     data['ServicePorviderID'] = this.servicePorviderID;
//     if (this.servicePorviderBranchesService != null) {
//       data['ServicePorviderBranchesService'] =
//           this.servicePorviderBranchesService!.map((v) => v.toJson()).toList();
//     }
//     data['ServicePorviderService'] = this.servicePorviderService;
//     return data;
//   }
// }

// class LocalizationLanguage {
//   int? iD;
//   bool? isActive;
//   String? nativeName;
//   String? englishName;
//   bool? isSupportedForUI;
//
//   LocalizationLanguage(
//       {this.iD,
//         this.isActive,
//         this.nativeName,
//         this.englishName,
//         this.isSupportedForUI});
//
//   LocalizationLanguage.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     nativeName = json['NativeName'];
//     englishName = json['EnglishName'];
//     isSupportedForUI = json['IsSupportedForUI'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['NativeName'] = this.nativeName;
//     data['EnglishName'] = this.englishName;
//     data['IsSupportedForUI'] = this.isSupportedForUI;
//     return data;
//   }
// }

// class ServicePorviderType {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? servicePorviderTypeID;
//   String? servicePorviderTypeName;
//   bool? isShowForPortal;
//   String? createdTime;
//   String? modifiedTime;
//   List<String>? servicePorvider;
//
//   ServicePorviderType(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.servicePorviderTypeID,
//         this.servicePorviderTypeName,
//         this.isShowForPortal,
//         this.createdTime,
//         this.modifiedTime,
//         this.servicePorvider});
//
//   ServicePorviderType.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     servicePorviderTypeID = json['ServicePorviderTypeID'];
//     servicePorviderTypeName = json['ServicePorviderTypeName'];
//     isShowForPortal = json['IsShowForPortal'];
//     createdTime = json['CreatedTime'];
//     modifiedTime = json['ModifiedTime'];
//     servicePorvider = json['ServicePorvider'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServicePorviderTypeID'] = this.servicePorviderTypeID;
//     data['ServicePorviderTypeName'] = this.servicePorviderTypeName;
//     data['IsShowForPortal'] = this.isShowForPortal;
//     data['CreatedTime'] = this.createdTime;
//     data['ModifiedTime'] = this.modifiedTime;
//     data['ServicePorvider'] = this.servicePorvider;
//     return data;
//   }
// }

// class ServiceCategory {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//
//   ServiceCategory(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage});
//
//   ServiceCategory.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServiceCat {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? serivceCatTypesID;
//   ServiceCategory? serivceCatTypes;
//   int? value;
//
//   ServiceCat(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.serivceCatTypesID,
//         this.serivceCatTypes,
//         this.value});
//
//   ServiceCat.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     serivceCatTypesID = json['SerivceCatTypesID'];
//     serivceCatTypes = json['SerivceCatTypes'] != null
//         ? new ServiceCategory.fromJson(json['SerivceCatTypes'])
//         : null;
//     value = json['Value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['SerivceCatTypesID'] = this.serivceCatTypesID;
//     if (this.serivceCatTypes != null) {
//       data['SerivceCatTypes'] = this.serivceCatTypes!.toJson();
//     }
//     data['Value'] = this.value;
//     return data;
//   }
// }
//
// class ServiceCategoryDetails {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? serviceCategoryID;
//   ServiceCategory? serviceCategory;
//
//   ServiceCategoryDetails(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.serviceCategoryID,
//         this.serviceCategory});
//
//   ServiceCategoryDetails.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     serviceCategoryID = json['ServiceCategoryID'];
//     serviceCategory = json['ServiceCategory'] != null
//         ? new ServiceCategory.fromJson(json['ServiceCategory'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServiceCategoryID'] = this.serviceCategoryID;
//     if (this.serviceCategory != null) {
//       data['ServiceCategory'] = this.serviceCategory!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServicePorviderBranchesService {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   int? servicesID;
//   String? services;
//   int? servicePorviderBranchesID;
//   ServicePorviderBranches? servicePorviderBranches;
//
//   ServicePorviderBranchesService(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.servicesID,
//         this.services,
//         this.servicePorviderBranchesID,
//         this.servicePorviderBranches});
//
//   ServicePorviderBranchesService.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     servicesID = json['ServicesID'];
//     services = json['Services'];
//     servicePorviderBranchesID = json['ServicePorviderBranchesID'];
//     servicePorviderBranches = json['ServicePorviderBranches'] != null
//         ? new ServicePorviderBranches.fromJson(json['ServicePorviderBranches'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['ServicesID'] = this.servicesID;
//     data['Services'] = this.services;
//     data['ServicePorviderBranchesID'] = this.servicePorviderBranchesID;
//     if (this.servicePorviderBranches != null) {
//       data['ServicePorviderBranches'] = this.servicePorviderBranches!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServicePorviderBranches {
//   int? id;
//   String? name;
//   String? telephone;
//   String? address;
//   String? email;
//   String? url;
//   String? map;
//   String? photoPath;
//   bool? isActive;
//   String? about;
//   String? officialWebsite;
//   String? telephoneTwo;
//   String? telephoneThird;
//   int? companyCodeOfServiceProvider;
//   int? cityID;
//   City? city;
//   int? servicePorviderLevelID;
//   ServicePorviderLevel? servicePorviderLevel;
//   String? servicePorviderLevelName;
//   String? createdTime;
//   int? createdBy;
//   String? modifiedTime;
//   int? modifiedBy;
//   String? mobile;
//   int? stateID;
//   DetailsState? state;
//   int? servicePorviderID;
//   String? servicePorvider;
//   String? servicePorviderSpecialtiesName;
//   int? servicePorviderSpecialtiesID;
//   ServicePorviderLevel? servicePorviderSpecialties;
//   String? servicePorviderSubspecialtiesName;
//   int? servicePorviderSubspecialtiesID;
//   ServicePorviderSubspecialties? servicePorviderSubspecialties;
//   List<String>? servicePorviderBranchesService;
//   List<ServicePorviderBranchesClinics>? servicePorviderBranchesClinics;
//   int? rating;
//   int? distance;
//   String? timeDistance;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? displayName;
//
//   ServicePorviderBranches(
//       {this.id,
//         this.name,
//         this.telephone,
//         this.address,
//         this.email,
//         this.url,
//         this.map,
//         this.photoPath,
//         this.isActive,
//         this.about,
//         this.officialWebsite,
//         this.telephoneTwo,
//         this.telephoneThird,
//         this.companyCodeOfServiceProvider,
//         this.cityID,
//         this.city,
//         this.servicePorviderLevelID,
//         this.servicePorviderLevel,
//         this.servicePorviderLevelName,
//         this.createdTime,
//         this.createdBy,
//         this.modifiedTime,
//         this.modifiedBy,
//         this.mobile,
//         this.stateID,
//         this.state,
//         this.servicePorviderID,
//         this.servicePorvider,
//         this.servicePorviderSpecialtiesName,
//         this.servicePorviderSpecialtiesID,
//         this.servicePorviderSpecialties,
//         this.servicePorviderSubspecialtiesName,
//         this.servicePorviderSubspecialtiesID,
//         this.servicePorviderSubspecialties,
//         this.servicePorviderBranchesService,
//         this.servicePorviderBranchesClinics,
//         this.rating,
//         this.distance,
//         this.timeDistance,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.displayName});
//
//   ServicePorviderBranches.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     name = json['Name'];
//     telephone = json['Telephone'];
//     address = json['Address'];
//     email = json['Email'];
//     url = json['Url'];
//     map = json['Map'];
//     photoPath = json['PhotoPath'];
//     isActive = json['IsActive'];
//     about = json['About'];
//     officialWebsite = json['OfficialWebsite'];
//     telephoneTwo = json['TelephoneTwo'];
//     telephoneThird = json['TelephoneThird'];
//     companyCodeOfServiceProvider = json['companyCodeOfServiceProvider'];
//     cityID = json['CityID'];
//     city = json['City'] != null ? new City.fromJson(json['City']) : null;
//     servicePorviderLevelID = json['ServicePorviderLevelID'];
//     servicePorviderLevel = json['ServicePorviderLevel'] != null
//         ? new ServicePorviderLevel.fromJson(json['ServicePorviderLevel'])
//         : null;
//     servicePorviderLevelName = json['ServicePorviderLevelName'];
//     createdTime = json['CreatedTime'];
//     createdBy = json['CreatedBy'];
//     modifiedTime = json['ModifiedTime'];
//     modifiedBy = json['ModifiedBy'];
//     mobile = json['Mobile'];
//     stateID = json['StateID'];
//     state = json['State'] != null ? new DetailsState.fromJson(json['State']) : null;
//     servicePorviderID = json['ServicePorviderID'];
//     servicePorvider = json['ServicePorvider'];
//     servicePorviderSpecialtiesName = json['ServicePorviderSpecialtiesName'];
//     servicePorviderSpecialtiesID = json['ServicePorviderSpecialtiesID'];
//     servicePorviderSpecialties = json['ServicePorviderSpecialties'] != null
//         ? new ServicePorviderLevel.fromJson(json['ServicePorviderSpecialties'])
//         : null;
//     servicePorviderSubspecialtiesName =
//     json['ServicePorviderSubspecialtiesName'];
//     servicePorviderSubspecialtiesID = json['ServicePorviderSubspecialtiesID'];
//     servicePorviderSubspecialties =
//     json['ServicePorviderSubspecialties'] != null
//         ? new ServicePorviderSubspecialties.fromJson(
//         json['ServicePorviderSubspecialties'])
//         : null;
//     servicePorviderBranchesService =
//         json['ServicePorviderBranchesService'].cast<String>();
//     if (json['ServicePorviderBranchesClinics'] != null) {
//       servicePorviderBranchesClinics = <ServicePorviderBranchesClinics>[];
//       json['ServicePorviderBranchesClinics'].forEach((v) {
//         servicePorviderBranchesClinics!
//             .add(new ServicePorviderBranchesClinics.fromJson(v));
//       });
//     }
//     rating = json['Rating'];
//     distance = json['Distance'];
//     timeDistance = json['TimeDistance'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     displayName = json['DisplayName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['Name'] = this.name;
//     data['Telephone'] = this.telephone;
//     data['Address'] = this.address;
//     data['Email'] = this.email;
//     data['Url'] = this.url;
//     data['Map'] = this.map;
//     data['PhotoPath'] = this.photoPath;
//     data['IsActive'] = this.isActive;
//     data['About'] = this.about;
//     data['OfficialWebsite'] = this.officialWebsite;
//     data['TelephoneTwo'] = this.telephoneTwo;
//     data['TelephoneThird'] = this.telephoneThird;
//     data['companyCodeOfServiceProvider'] = this.companyCodeOfServiceProvider;
//     data['CityID'] = this.cityID;
//     if (this.city != null) {
//       data['City'] = this.city!.toJson();
//     }
//     data['ServicePorviderLevelID'] = this.servicePorviderLevelID;
//     if (this.servicePorviderLevel != null) {
//       data['ServicePorviderLevel'] = this.servicePorviderLevel!.toJson();
//     }
//     data['ServicePorviderLevelName'] = this.servicePorviderLevelName;
//     data['CreatedTime'] = this.createdTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModifiedTime'] = this.modifiedTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['Mobile'] = this.mobile;
//     data['StateID'] = this.stateID;
//     if (this.state != null) {
//       data['State'] = this.state!.toJson();
//     }
//     data['ServicePorviderID'] = this.servicePorviderID;
//     data['ServicePorvider'] = this.servicePorvider;
//     data['ServicePorviderSpecialtiesName'] =
//         this.servicePorviderSpecialtiesName;
//     data['ServicePorviderSpecialtiesID'] = this.servicePorviderSpecialtiesID;
//     if (this.servicePorviderSpecialties != null) {
//       data['ServicePorviderSpecialties'] =
//           this.servicePorviderSpecialties!.toJson();
//     }
//     data['ServicePorviderSubspecialtiesName'] =
//         this.servicePorviderSubspecialtiesName;
//     data['ServicePorviderSubspecialtiesID'] =
//         this.servicePorviderSubspecialtiesID;
//     if (this.servicePorviderSubspecialties != null) {
//       data['ServicePorviderSubspecialties'] =
//           this.servicePorviderSubspecialties!.toJson();
//     }
//     data['ServicePorviderBranchesService'] =
//         this.servicePorviderBranchesService;
//     if (this.servicePorviderBranchesClinics != null) {
//       data['ServicePorviderBranchesClinics'] =
//           this.servicePorviderBranchesClinics!.map((v) => v.toJson()).toList();
//     }
//     data['Rating'] = this.rating;
//     data['Distance'] = this.distance;
//     data['TimeDistance'] = this.timeDistance;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['DisplayName'] = this.displayName;
//     return data;
//   }
// }
//
// class City {
//   int? iD;
//   bool? isActive;
//   String? name;
//   String? nativeName;
//   int? stateID;
//   DetailsState? state;
//
//   City(
//       {this.iD,
//         this.isActive,
//         this.name,
//         this.nativeName,
//         this.stateID,
//         this.state});
//
//   City.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     name = json['Name'];
//     nativeName = json['NativeName'];
//     stateID = json['StateID'];
//     state = json['State'] != null ? new DetailsState.fromJson(json['State']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['Name'] = this.name;
//     data['NativeName'] = this.nativeName;
//     data['StateID'] = this.stateID;
//     if (this.state != null) {
//       data['State'] = this.state!.toJson();
//     }
//     return data;
//   }
// }
//
// class DetailsState {
//   int? iD;
//   bool? isActive;
//   String? name;
//   String? nativeName;
//   Country? country;
//
//   DetailsState({this.iD, this.isActive, this.name, this.nativeName, this.country});
//
//   DetailsState.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     name = json['Name'];
//     nativeName = json['NativeName'];
//     country =
//     json['Country'] != null ? new Country.fromJson(json['Country']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['Name'] = this.name;
//     data['NativeName'] = this.nativeName;
//     if (this.country != null) {
//       data['Country'] = this.country!.toJson();
//     }
//     return data;
//   }
// }
//
// class Country {
//   int? iD;
//   bool? isActive;
//   String? name;
//   String? nationality;
//   String? nativeName;
//   String? nativeNationalityName;
//   String? countryCode;
//   Currency? currency;
//
//   Country(
//       {this.iD,
//         this.isActive,
//         this.name,
//         this.nationality,
//         this.nativeName,
//         this.nativeNationalityName,
//         this.countryCode,
//         this.currency});
//
//   Country.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     name = json['Name'];
//     nationality = json['Nationality'];
//     nativeName = json['NativeName'];
//     nativeNationalityName = json['NativeNationalityName'];
//     countryCode = json['CountryCode'];
//     currency = json['Currency'] != null
//         ? new Currency.fromJson(json['Currency'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['Name'] = this.name;
//     data['Nationality'] = this.nationality;
//     data['NativeName'] = this.nativeName;
//     data['NativeNationalityName'] = this.nativeNationalityName;
//     data['CountryCode'] = this.countryCode;
//     if (this.currency != null) {
//       data['Currency'] = this.currency!.toJson();
//     }
//     return data;
//   }
// }
//
// class Currency {
//   int? iD;
//   bool? isActive;
//   String? name;
//   String? currencyCode;
//
//   Currency({this.iD, this.isActive, this.name, this.currencyCode});
//
//   Currency.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     name = json['Name'];
//     currencyCode = json['CurrencyCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['Name'] = this.name;
//     data['CurrencyCode'] = this.currencyCode;
//     return data;
//   }
// }
//
// class ServicePorviderLevel {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? servicePorviderTypeID;
//   ServicePorviderType? servicePorviderType;
//
//   ServicePorviderLevel(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.servicePorviderTypeID,
//         this.servicePorviderType});
//
//   ServicePorviderLevel.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     servicePorviderTypeID = json['ServicePorviderTypeID'];
//     servicePorviderType = json['ServicePorviderType'] != null
//         ? new ServicePorviderType.fromJson(json['ServicePorviderType'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServicePorviderTypeID'] = this.servicePorviderTypeID;
//     if (this.servicePorviderType != null) {
//       data['ServicePorviderType'] = this.servicePorviderType!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServicePorviderSubspecialties {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? servicePorviderSpecialtiesID;
//   ServicePorviderLevel? servicePorviderSpecialties;
//
//   ServicePorviderSubspecialties(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.servicePorviderSpecialtiesID,
//         this.servicePorviderSpecialties});
//
//   ServicePorviderSubspecialties.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     servicePorviderSpecialtiesID = json['ServicePorviderSpecialtiesID'];
//     servicePorviderSpecialties = json['ServicePorviderSpecialties'] != null
//         ? new ServicePorviderLevel.fromJson(json['ServicePorviderSpecialties'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServicePorviderSpecialtiesID'] = this.servicePorviderSpecialtiesID;
//     if (this.servicePorviderSpecialties != null) {
//       data['ServicePorviderSpecialties'] =
//           this.servicePorviderSpecialties!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServicePorviderBranchesClinics {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   int? clinicsID;
//   Clinics? clinics;
//   int? servicePorviderBranchesID;
//   String? servicePorviderBranches;
//
//   ServicePorviderBranchesClinics(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.clinicsID,
//         this.clinics,
//         this.servicePorviderBranchesID,
//         this.servicePorviderBranches});
//
//   ServicePorviderBranchesClinics.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     clinicsID = json['ClinicsID'];
//     clinics =
//     json['Clinics'] != null ? new Clinics.fromJson(json['Clinics']) : null;
//     servicePorviderBranchesID = json['ServicePorviderBranchesID'];
//     servicePorviderBranches = json['ServicePorviderBranches'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['ClinicsID'] = this.clinicsID;
//     if (this.clinics != null) {
//       data['Clinics'] = this.clinics!.toJson();
//     }
//     data['ServicePorviderBranchesID'] = this.servicePorviderBranchesID;
//     data['ServicePorviderBranches'] = this.servicePorviderBranches;
//     return data;
//   }
// }
//
// class Clinics {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? name;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   int? servicePorviderTypeID;
//   ServicePorviderType? servicePorviderType;
//   List<String>? servicePorviderClinics;
//   List<String>? servicePorviderBranchesClinics;
//
//   Clinics(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.name,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.servicePorviderTypeID,
//         this.servicePorviderType,
//         this.servicePorviderClinics,
//         this.servicePorviderBranchesClinics});
//
//   Clinics.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     name = json['Name'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     servicePorviderTypeID = json['ServicePorviderTypeID'];
//     servicePorviderType = json['ServicePorviderType'] != null
//         ? new ServicePorviderType.fromJson(json['ServicePorviderType'])
//         : null;
//     servicePorviderClinics = json['ServicePorviderClinics'].cast<String>();
//     servicePorviderBranchesClinics =
//         json['ServicePorviderBranchesClinics'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Name'] = this.name;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['ServicePorviderTypeID'] = this.servicePorviderTypeID;
//     if (this.servicePorviderType != null) {
//       data['ServicePorviderType'] = this.servicePorviderType!.toJson();
//     }
//     data['ServicePorviderClinics'] = this.servicePorviderClinics;
//     data['ServicePorviderBranchesClinics'] =
//         this.servicePorviderBranchesClinics;
//     return data;
//   }
// }
//
// class ServicePorvider {
//   int? id;
//   String? name;
//   String? telephone;
//   String? address;
//   String? email;
//   String? url;
//   String? map;
//   String? photoPath;
//   bool? isActive;
//   int? cityID;
//   City? city;
//   String? about;
//   String? officialWebsite;
//   String? telephoneTwo;
//   String? telephoneThird;
//   int? companyCodeOfServiceProvider;
//   int? servicePorviderTypeID;
//   ServicePorviderType? servicePorviderType;
//   String? createdTime;
//   int? createdBy;
//   String? modifiedTime;
//   int? modifiedBy;
//   String? mobile;
//   int? servicePorviderLevelID;
//   String? servicePorviderLevelName;
//   ServicePorviderLevel? servicePorviderLevel;
//   int? servicePorviderSpecialtiesID;
//   String? servicePorviderSpecialtiesName;
//   ServicePorviderLevel? servicePorviderSpecialties;
//   int? servicePorviderSubspecialtiesID;
//   String? servicePorviderSubspecialtiesName;
//   ServicePorviderSubspecialties? servicePorviderSubspecialties;
//   int? stateID;
//   DetailsState? state;
//   List<ServicePorviderBranches>? servicePorviderBranches;
//   List<String>? servicePorviderService;
//   List<ServicePorviderClinics>? servicePorviderClinics;
//   int? rating;
//   int? distance;
//   String? timeDistance;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   int? accountNumber;
//   int? bankID;
//   Bank? bank;
//   int? bankBranchID;
//   BankBranch? bankBranch;
//   int? serviceCatID;
//   ServiceCat? serviceCat;
//
//   ServicePorvider(
//       {this.id,
//         this.name,
//         this.telephone,
//         this.address,
//         this.email,
//         this.url,
//         this.map,
//         this.photoPath,
//         this.isActive,
//         this.cityID,
//         this.city,
//         this.about,
//         this.officialWebsite,
//         this.telephoneTwo,
//         this.telephoneThird,
//         this.companyCodeOfServiceProvider,
//         this.servicePorviderTypeID,
//         this.servicePorviderType,
//         this.createdTime,
//         this.createdBy,
//         this.modifiedTime,
//         this.modifiedBy,
//         this.mobile,
//         this.servicePorviderLevelID,
//         this.servicePorviderLevelName,
//         this.servicePorviderLevel,
//         this.servicePorviderSpecialtiesID,
//         this.servicePorviderSpecialtiesName,
//         this.servicePorviderSpecialties,
//         this.servicePorviderSubspecialtiesID,
//         this.servicePorviderSubspecialtiesName,
//         this.servicePorviderSubspecialties,
//         this.stateID,
//         this.state,
//         this.servicePorviderBranches,
//         this.servicePorviderService,
//         this.servicePorviderClinics,
//         this.rating,
//         this.distance,
//         this.timeDistance,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.accountNumber,
//         this.bankID,
//         this.bank,
//         this.bankBranchID,
//         this.bankBranch,
//         this.serviceCatID,
//         this.serviceCat});
//
//   ServicePorvider.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     name = json['Name'];
//     telephone = json['Telephone'];
//     address = json['Address'];
//     email = json['Email'];
//     url = json['Url'];
//     map = json['Map'];
//     photoPath = json['PhotoPath'];
//     isActive = json['IsActive'];
//     cityID = json['CityID'];
//     city = json['City'] != null ? new City.fromJson(json['City']) : null;
//     about = json['About'];
//     officialWebsite = json['OfficialWebsite'];
//     telephoneTwo = json['TelephoneTwo'];
//     telephoneThird = json['TelephoneThird'];
//     companyCodeOfServiceProvider = json['companyCodeOfServiceProvider'];
//     servicePorviderTypeID = json['ServicePorviderTypeID'];
//     servicePorviderType = json['ServicePorviderType'] != null
//         ? new ServicePorviderType.fromJson(json['ServicePorviderType'])
//         : null;
//     createdTime = json['CreatedTime'];
//     createdBy = json['CreatedBy'];
//     modifiedTime = json['ModifiedTime'];
//     modifiedBy = json['ModifiedBy'];
//     mobile = json['Mobile'];
//     servicePorviderLevelID = json['ServicePorviderLevelID'];
//     servicePorviderLevelName = json['ServicePorviderLevelName'];
//     servicePorviderLevel = json['ServicePorviderLevel'] != null
//         ? new ServicePorviderLevel.fromJson(json['ServicePorviderLevel'])
//         : null;
//     servicePorviderSpecialtiesID = json['ServicePorviderSpecialtiesID'];
//     servicePorviderSpecialtiesName = json['ServicePorviderSpecialtiesName'];
//     servicePorviderSpecialties = json['ServicePorviderSpecialties'] != null
//         ? new ServicePorviderLevel.fromJson(json['ServicePorviderSpecialties'])
//         : null;
//     servicePorviderSubspecialtiesID = json['ServicePorviderSubspecialtiesID'];
//     servicePorviderSubspecialtiesName =
//     json['ServicePorviderSubspecialtiesName'];
//     servicePorviderSubspecialties =
//     json['ServicePorviderSubspecialties'] != null
//         ? new ServicePorviderSubspecialties.fromJson(
//         json['ServicePorviderSubspecialties'])
//         : null;
//     stateID = json['StateID'];
//     state = json['State'] != null ? new DetailsState.fromJson(json['State']) : null;
//     if (json['ServicePorviderBranches'] != null) {
//       servicePorviderBranches = <ServicePorviderBranches>[];
//       json['ServicePorviderBranches'].forEach((v) {
//         servicePorviderBranches!.add(new ServicePorviderBranches.fromJson(v));
//       });
//     }
//     servicePorviderService = json['ServicePorviderService'].cast<String>();
//     if (json['ServicePorviderClinics'] != null) {
//       servicePorviderClinics = <ServicePorviderClinics>[];
//       json['ServicePorviderClinics'].forEach((v) {
//         servicePorviderClinics!.add(new ServicePorviderClinics.fromJson(v));
//       });
//     }
//     rating = json['Rating'];
//     distance = json['Distance'];
//     timeDistance = json['TimeDistance'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     accountNumber = json['AccountNumber'];
//     bankID = json['BankID'];
//     bank = json['Bank'] != null ? new Bank.fromJson(json['Bank']) : null;
//     bankBranchID = json['BankBranchID'];
//     bankBranch = json['BankBranch'] != null
//         ? new BankBranch.fromJson(json['BankBranch'])
//         : null;
//     serviceCatID = json['ServiceCatID'];
//     serviceCat = json['ServiceCat'] != null
//         ? new ServiceCat.fromJson(json['ServiceCat'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['Name'] = this.name;
//     data['Telephone'] = this.telephone;
//     data['Address'] = this.address;
//     data['Email'] = this.email;
//     data['Url'] = this.url;
//     data['Map'] = this.map;
//     data['PhotoPath'] = this.photoPath;
//     data['IsActive'] = this.isActive;
//     data['CityID'] = this.cityID;
//     if (this.city != null) {
//       data['City'] = this.city!.toJson();
//     }
//     data['About'] = this.about;
//     data['OfficialWebsite'] = this.officialWebsite;
//     data['TelephoneTwo'] = this.telephoneTwo;
//     data['TelephoneThird'] = this.telephoneThird;
//     data['companyCodeOfServiceProvider'] = this.companyCodeOfServiceProvider;
//     data['ServicePorviderTypeID'] = this.servicePorviderTypeID;
//     if (this.servicePorviderType != null) {
//       data['ServicePorviderType'] = this.servicePorviderType!.toJson();
//     }
//     data['CreatedTime'] = this.createdTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModifiedTime'] = this.modifiedTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['Mobile'] = this.mobile;
//     data['ServicePorviderLevelID'] = this.servicePorviderLevelID;
//     data['ServicePorviderLevelName'] = this.servicePorviderLevelName;
//     if (this.servicePorviderLevel != null) {
//       data['ServicePorviderLevel'] = this.servicePorviderLevel!.toJson();
//     }
//     data['ServicePorviderSpecialtiesID'] = this.servicePorviderSpecialtiesID;
//     data['ServicePorviderSpecialtiesName'] =
//         this.servicePorviderSpecialtiesName;
//     if (this.servicePorviderSpecialties != null) {
//       data['ServicePorviderSpecialties'] =
//           this.servicePorviderSpecialties!.toJson();
//     }
//     data['ServicePorviderSubspecialtiesID'] =
//         this.servicePorviderSubspecialtiesID;
//     data['ServicePorviderSubspecialtiesName'] =
//         this.servicePorviderSubspecialtiesName;
//     if (this.servicePorviderSubspecialties != null) {
//       data['ServicePorviderSubspecialties'] =
//           this.servicePorviderSubspecialties!.toJson();
//     }
//     data['StateID'] = this.stateID;
//     if (this.state != null) {
//       data['State'] = this.state!.toJson();
//     }
//     if (this.servicePorviderBranches != null) {
//       data['ServicePorviderBranches'] =
//           this.servicePorviderBranches!.map((v) => v.toJson()).toList();
//     }
//     data['ServicePorviderService'] = this.servicePorviderService;
//     if (this.servicePorviderClinics != null) {
//       data['ServicePorviderClinics'] =
//           this.servicePorviderClinics!.map((v) => v.toJson()).toList();
//     }
//     data['Rating'] = this.rating;
//     data['Distance'] = this.distance;
//     data['TimeDistance'] = this.timeDistance;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['AccountNumber'] = this.accountNumber;
//     data['BankID'] = this.bankID;
//     if (this.bank != null) {
//       data['Bank'] = this.bank!.toJson();
//     }
//     data['BankBranchID'] = this.bankBranchID;
//     if (this.bankBranch != null) {
//       data['BankBranch'] = this.bankBranch!.toJson();
//     }
//     data['ServiceCatID'] = this.serviceCatID;
//     if (this.serviceCat != null) {
//       data['ServiceCat'] = this.serviceCat!.toJson();
//     }
//     return data;
//   }
// }
//
// class ServicePorviderClinics {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   int? clinicsID;
//   Clinics? clinics;
//   int? servicePorviderID;
//   String? servicePorvider;
//
//   ServicePorviderClinics(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.clinicsID,
//         this.clinics,
//         this.servicePorviderID,
//         this.servicePorvider});
//
//   ServicePorviderClinics.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     clinicsID = json['ClinicsID'];
//     clinics =
//     json['Clinics'] != null ? new Clinics.fromJson(json['Clinics']) : null;
//     servicePorviderID = json['ServicePorviderID'];
//     servicePorvider = json['ServicePorvider'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['ClinicsID'] = this.clinicsID;
//     if (this.clinics != null) {
//       data['Clinics'] = this.clinics!.toJson();
//     }
//     data['ServicePorviderID'] = this.servicePorviderID;
//     data['ServicePorvider'] = this.servicePorvider;
//     return data;
//   }
// }
//
// class Bank {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   String? name;
//   String? nativeName;
//
//   Bank(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.name,
//         this.nativeName});
//
//   Bank.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     name = json['Name'];
//     nativeName = json['NativeName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['Name'] = this.name;
//     data['NativeName'] = this.nativeName;
//     return data;
//   }
// }
//
// class BankBranch {
//   int? iD;
//   bool? isActive;
//   int? saasProfileId;
//   String? creationTime;
//   int? createdBy;
//   String? modificationTime;
//   int? modifiedBy;
//   bool? isDeleted;
//   String? deleteTime;
//   int? deletedBy;
//   String? description;
//   String? localizedParent;
//   LocalizationLanguage? localizationLanguage;
//   String? name;
//   String? nativeName;
//   int? bankID;
//   Bank? bank;
//
//   BankBranch(
//       {this.iD,
//         this.isActive,
//         this.saasProfileId,
//         this.creationTime,
//         this.createdBy,
//         this.modificationTime,
//         this.modifiedBy,
//         this.isDeleted,
//         this.deleteTime,
//         this.deletedBy,
//         this.description,
//         this.localizedParent,
//         this.localizationLanguage,
//         this.name,
//         this.nativeName,
//         this.bankID,
//         this.bank});
//
//   BankBranch.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     isActive = json['IsActive'];
//     saasProfileId = json['SaasProfileId'];
//     creationTime = json['CreationTime'];
//     createdBy = json['CreatedBy'];
//     modificationTime = json['ModificationTime'];
//     modifiedBy = json['ModifiedBy'];
//     isDeleted = json['IsDeleted'];
//     deleteTime = json['DeleteTime'];
//     deletedBy = json['DeletedBy'];
//     description = json['Description'];
//     localizedParent = json['LocalizedParent'];
//     localizationLanguage = json['LocalizationLanguage'] != null
//         ? new LocalizationLanguage.fromJson(json['LocalizationLanguage'])
//         : null;
//     name = json['Name'];
//     nativeName = json['NativeName'];
//     bankID = json['BankID'];
//     bank = json['Bank'] != null ? new Bank.fromJson(json['Bank']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IsActive'] = this.isActive;
//     data['SaasProfileId'] = this.saasProfileId;
//     data['CreationTime'] = this.creationTime;
//     data['CreatedBy'] = this.createdBy;
//     data['ModificationTime'] = this.modificationTime;
//     data['ModifiedBy'] = this.modifiedBy;
//     data['IsDeleted'] = this.isDeleted;
//     data['DeleteTime'] = this.deleteTime;
//     data['DeletedBy'] = this.deletedBy;
//     data['Description'] = this.description;
//     data['LocalizedParent'] = this.localizedParent;
//     if (this.localizationLanguage != null) {
//       data['LocalizationLanguage'] = this.localizationLanguage!.toJson();
//     }
//     data['Name'] = this.name;
//     data['NativeName'] = this.nativeName;
//     data['BankID'] = this.bankID;
//     if (this.bank != null) {
//       data['Bank'] = this.bank!.toJson();
//     }
//     return data;
//   }
// }