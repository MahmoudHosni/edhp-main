import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompanyState.dart';
import 'package:edhp/models/MedicalCompany.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsuranceCompaniesCubit extends Cubit<InsuranceCompanyState> {

  InsuranceCompaniesCubit() : super(InitiateInsuranceCompanyItemsState());

  static InsuranceCompaniesCubit get(BuildContext context) => BlocProvider.of(context);

  List<MedicalCompany> companiesList = [];

  Future getCompanies(String? company) async {
    companiesList.clear();
    emit(InsuranceCompanyItemLoadingState());
    print("company ::: ${company}");
      await DioHelper.getData(
        path: EndPoint.getOrganizations,queryParameters: {
          "MedicalInsuranceCompanyID": company
         },
        token: CacheHelper.getData(key: Token),
      ).then((value) {
        companiesList.clear();
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

  Future<List<MedicalCompany>> getCompaniesDirect(String? company)  async {
    companiesList.clear();
    print("company ::: ${company}");
    await DioHelper.getData(
      path: EndPoint.getOrganizations,queryParameters: {
      "MedicalInsuranceCompanyID": company
    },
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      companiesList.clear();
      print(value.data);
      value.data.forEach((element) {
        companiesList.add(MedicalCompany.fromJson(element));
      });
      return Future(() => companiesList);
    }).catchError((error) {
      print(error.toString());
      return Future(() => null);
    });
    return Future(() => companiesList);
  }
}