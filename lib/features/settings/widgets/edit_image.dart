import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/edit_profile/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paths.dart';
import '../../edit_profile/cubit/state.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileStates>(
      listener: (context, state) {
        if(state is UploadProfileImageSuccessfullyState){

        }
      },
      builder: (context, state) {
        return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.file(
                  GetProfileCubit.get(context).profileImage!,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  EditProfileCubit.get(context).getProfileImageFromGallery().then((value) {
                    EditProfileCubit.get(context).uploadFileToServer(EditProfileCubit.get(context).imagePath);
                  });
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppPaths.editIconSvg,),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
