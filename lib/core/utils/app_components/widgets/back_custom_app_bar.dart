import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../app_colors.dart';
import '../../app_paths.dart';
import '../../styles/styles.dart';

class BackCustomAppBar extends StatelessWidget {
  const BackCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).pop();
        },
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('رجوع' , style: Styles.textStyle12W400.copyWith(color: AppColors.lightGrayColor),),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(AppPaths.backIconSvg ,),
            ],
          ),
        ),
      ),
    );
  }
}
