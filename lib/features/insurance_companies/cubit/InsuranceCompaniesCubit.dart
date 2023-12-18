import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompanyState.dart';
import 'package:edhp/models/MedicalCompany.dart';
import 'package:edhp/models/get_organization_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsuranceCompaniesCubit extends Cubit<InsuranceCompanyState> {

  InsuranceCompaniesCubit() : super(InitiateInsuranceCompanyItemsState());

  static InsuranceCompaniesCubit get(BuildContext context) => BlocProvider.of(context);

  List<MedicalCompany> companiesList = [];

  Future getCompanies() async {
    emit(InsuranceCompanyItemLoadingState());
    if (companiesList!.isEmpty) {
      await DioHelper.getData(
        path: EndPoint.getOrganizations,
        token: CacheHelper.getData(key: 'token'),
      ).then((value) {
        print(value.data);
        value.data.forEach((element) {
          companiesList.add(MedicalCompany.fromJson(element));
        });
        print('###############################');
        print(companiesList[0].name);
        emit(InsuranceCompanyItemSuccessfullyState());
      }).catchError((error) {
        print(error.toString());
        emit(InsuranceCompanyItemErrorState());
      });
    }
  }
}