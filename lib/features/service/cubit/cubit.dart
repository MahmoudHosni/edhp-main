import 'package:edhp/features/service/cubit/states.dart';
import 'package:edhp/models/membership_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_point.dart';
import '../../../core/utils/app_constants.dart';

class OurProductCubit extends Cubit<OurProductStates> {
  OurProductCubit() : super(OurProductInitialState());

  static OurProductCubit get(BuildContext context) => BlocProvider.of(context);

  List<MembershipType> membershipTypeList = [];

  Future getMembershipType({int? OrganizationID=0,String? NationalNumber='',String? OrganizationMembershipNumber=''}) async {
    emit(OurProductLoadingState());
    if(membershipTypeList.isEmpty){
      String? path = '';
      if((OrganizationID??0) > 0){
        path = EndPoint.getMembershipTypes+"?OrganizationID=${OrganizationID}&NationalNumber=${NationalNumber}&OrganizationMembershipNumber=${OrganizationMembershipNumber}";
      }else{
        path =  EndPoint.getMembershipTypes ;
      }

      await DioHelper.getData(
        path: path ,
        token: token,
      ).then((value) {
        membershipTypeList = [];
        // print(value.data);
        value.data.forEach((element) {
          membershipTypeList.add(MembershipType.fromJson(element),);
        });
        print(membershipTypeList[0].name);
        emit(OurProductSuccessfullyState());
      }).catchError((error) {
        print(error.toString());
        emit(OurProductErrorState());
      });
    }
  }
}