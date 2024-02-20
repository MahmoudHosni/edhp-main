import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalFileScreen extends StatelessWidget {
  const MedicalFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: StringsManager.medicalFile,showBack: false,body: Center(
      child: SvgPicture.asset('assets/icons/md1_file.svg'),
    ));
  }
}
