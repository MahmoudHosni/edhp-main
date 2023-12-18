import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompanyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectInsuranceCompany extends StatefulWidget{
  @override
  State<SelectInsuranceCompany> createState() => _SelectInsuranceCompanyState();
}

class _SelectInsuranceCompanyState extends State<SelectInsuranceCompany> {
  final formKey = GlobalKey<FormState>();
  int companyID=-1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InsuranceCompaniesCubit, InsuranceCompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                  const BackCustomAppBar(),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(StringsManager.selectJahah , style: Styles.textStyle20W500,),
                  const SizedBox(height: 15,),
                  if(state is InsuranceCompanyItemLoadingState)
                    const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 20),
                      itemBuilder: (_, index) => InkWell(
                        onTap: (){
                          setState(() {
                            companyID = InsuranceCompaniesCubit.get(context).companiesList[index].iD ??-1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: companyID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? AppColors.primaryBlueColor : AppColors.whiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.lightGrayColor,
                                    blurRadius: 1,
                                  ),
                                ]
                            ),
                            child:  Container(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AppPaths.companyImage,width: 85,height: 85,),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                    child: Text(InsuranceCompaniesCubit.get(context).companiesList[index].name ??'' ,textAlign: TextAlign.center,
                                      style: Styles.textStyle13W400.
                                                    copyWith(color: companyID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? Colors.white:Colors.black),maxLines: 2,),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: InsuranceCompaniesCubit.get(context).companiesList.length,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  DefaultButton(backgroundColor: (companyID > 0) ? AppColors.primaryBlueColor : Colors.grey,
                    function: () {
                      GoRouter.of(context).push(AppRouters.kOrganizationMembershipDataScreen);
                    },
                    text: StringsManager.select,
                    redius: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}