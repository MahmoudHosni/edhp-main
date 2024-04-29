import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/models/get_organization_item_model.dart';
import 'package:edhp/models/validate_organization_member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class CompanyItemCubit extends Cubit<CompanyItemsStates> {

  CompanyItemCubit() : super(InitiateCompanyItemsState());

  static CompanyItemCubit get(BuildContext context) => BlocProvider.of(context);

  List<GetOrganizationItem> organizationItemsList = [];
  Future getOrganizations() async{
    organizationItemsList.clear();
    emit(CompanyItemLoadingState());
    if(organizationItemsList!.isEmpty) {
      await DioHelper.getData(
        path: EndPoint.getMedicalCompanies,
        token: CacheHelper.getData(key: Token),
      ).then((value) {
        organizationItemsList.clear();
        print(value.data);
        value.data.forEach((element) {
          organizationItemsList.add(GetOrganizationItem.fromJson(element));
        });
        print('###############################');
        print(organizationItemsList[0].name);
        emit(CompanyItemSuccessfullyState());
      }).catchError((error) {
        print(error.toString());
        emit(CompanyItemErrorState());
      });
    }
  }

  String ? nationalId;
  int ? membershipNumber;
  ValidateOrganizationMemberModel ? validateOrganizationMemberModel;
  Future validateOrganizationMember({
    // required int organizationId,
    required String identityNumber,
    required int organizationMembershipNumber,
  }) async{
    emit(ValidateOrganizationMemberLoadingState());
    await DioHelper.postData(
      path: EndPoint.validateOrganizationMember,
      data: {
        // "OrganizationID" : organizationId,
        "IdentityNumber" : identityNumber,
        "OrganizationMembershipNumber" : organizationMembershipNumber,
      },
    ).then((value) {
      print(value.data);
      membershipNumber = organizationMembershipNumber;
      nationalId = identityNumber;
      validateOrganizationMemberModel = ValidateOrganizationMemberModel.fromJson(value.data);
      print('#############################');
      print(validateOrganizationMemberModel!.resultObject!.profileName);
      emit(ValidateOrganizationMemberSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(ValidateOrganizationMemberErrorState());
    });
  }

}