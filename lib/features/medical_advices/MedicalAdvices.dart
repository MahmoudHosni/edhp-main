import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesCubit.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesState.dart';
import 'package:edhp/models/Medical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalAdvices extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MedicalAdvicesCubit()..getAdvices(),
        child: BlocConsumer<MedicalAdvicesCubit, MedicalAdvicesState>(
          listener: (context, state) {       },
          builder: (context, state) {
            MedicalAdvicesCubit cubit = MedicalAdvicesCubit.get(context);
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(StringsManager.medicalAdvices , style: Styles.textStyle20W500 , textAlign: TextAlign.center),
                            Spacer(),
                            BackCustomAppBar(),
                          ],
                        ),
                      ),
                      if(state is MedicalAdvicesLoadingState)
                        const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => MedicalAdviceCard(item : cubit.medicalLst![index]),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                          itemCount: cubit.medicalLst?.length ??0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MedicalAdviceCard extends StatelessWidget{
  final MedicalAdvice item;

  MedicalAdviceCard({required this.item});

  @override
  Widget build(BuildContext context) {
      return Container(margin: EdgeInsets.all(8),width: double.infinity,padding: EdgeInsets.all(8),height: 105,alignment: Alignment.center,color: Colors.white,
      child: Card(elevation: 8,color: Colors.white,child:
        Center(child: Text(item.name ??'',style: Styles.textStyle14W500,textAlign: TextAlign.right,)),
        ),);
  }

}