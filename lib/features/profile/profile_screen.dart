import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../confirm_membership_data/widgets/confirm_data_field_and_value_item.dart';
import 'cubit/get_profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetProfileState>(
      listener: (context, state) {      },
      builder: (context, state)  {
        GetProfileCubit cubit = GetProfileCubit.get(context);
        if(state is GetProfileSuccessfullyState || state is GetProfileImageSuccessfullyState || cubit.profileImage != null) {
          return ViewContainer(title: StringsManager.personalProfile,body:Container(height: double.infinity,
            child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(width: 80, height: 80,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                        ),
                      )),
                      const SizedBox(
                        height: 34,
                      ),
                      ConfirmDataFieldAndValueItem(field: 'الإسم', value: cubit.userProfileModel!.profileName!.toString()),
                      ConfirmDataFieldAndValueItem(field: 'اسم المستخدم', value: cubit.userProfileModel!.userName!.toString()),
                      ConfirmDataFieldAndValueItem(field: 'رقم الهاتف', value: cubit.userProfileModel!.mobileNumber!.toString()),
                      ConfirmDataFieldAndValueItem(field: 'البريد الالكتروني', value: cubit.userProfileModel!.email!.toString()),
                      (cubit.userProfileModel!.identityNumber??'').length>2 ? ConfirmDataFieldAndValueItem(field: 'الرقم القومي', value: cubit.userProfileModel!.identityNumber.toString()):SizedBox(),
                      ConfirmDataFieldAndValueItem(field: 'النوع', value: cubit.userProfileModel!.gender! == 1 ? 'ذكر' : 'انثى'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/15,
                      ),
                      // DefaultButton(
                      //   function: (){
                      //     GoRouter.of(context).push(AppRouters.kAddRelativesScreen);
                      //   },
                      //   text: 'اضافة التابعين' ,
                      //   width: MediaQuery.of(context).size.width / 1.5,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // DefaultButton(
                      //   function: (){
                      //     GoRouter.of(context).push(AppRouters.kMedicalRecordScreen);
                      //   },
                      //   text: 'السجل المرضي' ,
                      //   width: MediaQuery.of(context).size.width / 1.5,
                      // ),
                    ],
                  ),
                ),
          ),
        );
        } else if(state is GetProfileLoadingState || state is GetProfileImageLoadingState) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlueColor,),
              ),
            ),
          );
        }
        return const Scaffold(
            body: SafeArea(
              child: Column(),
            ),
        );
      },
    );
  }
}
