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

  Future getMembershipType() async {
    emit(OurProductLoadingState());
    if(membershipTypeList.isEmpty){
      await DioHelper.getData(
        path: EndPoint.getMembershipTypes ,
        token: token,
      ).then((value) {
        print(value.data);
        value.data['MembershipTypes'].forEach((element) {
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