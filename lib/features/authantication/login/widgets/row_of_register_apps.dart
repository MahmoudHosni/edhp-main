import 'package:edhp/features/authantication/login/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_paths.dart';
import 'clickable_register_app_container_item.dart';

class RowOfRegisterApps extends StatelessWidget {
  const RowOfRegisterApps({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(child: ClickableRegisterAppContainerItem(appLogoPath: AppPaths.facebookLogoPath,),onTap: (){
          
        }),
        ClickableRegisterAppContainerItem(appLogoPath: AppPaths.googleLogoPath),
        ClickableRegisterAppContainerItem(appLogoPath: AppPaths.appleLogoPath),
      ],
    );
  }
}
