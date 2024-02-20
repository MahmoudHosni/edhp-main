import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/edit_profile/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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
                child: Image.network(
                    '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}',
                    fit: BoxFit.cover,
                    width: 115,
                    height: 115,
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
                )
              ),
              InkWell(
                onTap: () {
                  _showChoiceDialog(context, EditProfileCubit.get(context).getProfileImageFromGallery);
                  // EditProfileCubit.get(context).getProfileImageFromGallery().then((value) {
                  //   EditProfileCubit.get(context).uploadFileToServer(EditProfileCubit.get(context).imagePath);
                  // });
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

  Future<void>_showChoiceDialog(BuildContext context,Function callBack) {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(backgroundColor: Colors.blue,
        title: Text("اختر",style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.white,),
              ListTile(
                onTap: (){
                  callBack(ImageSource.gallery);
                  Navigator.pop(context);
                },
                title: Text("معرض الصور",style: Styles.textStyle13W500.copyWith(color: Colors.white),),
                leading: Icon(Icons.image,color: Colors.white,),
              ),

              Divider(height: 1,color: Colors.white,),
              ListTile(
                onTap: (){
                  callBack(ImageSource.camera);
                  Navigator.pop(context);
                },
                title: Text("الكاميرا",style: Styles.textStyle13W500.copyWith(color: Colors.white)),
                leading: Icon(Icons.camera,color: Colors.white,),
              ),
            ],
          ),
        ),);
    });
  }
}
