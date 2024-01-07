import 'dart:io';

import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/confirm_membership_data/widgets/CardPreviewWidget.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CardPreview extends StatefulWidget{
  final SubscriptionRequest subscriptionRequest;

  CardPreview({required this.subscriptionRequest});

  @override
  State<CardPreview> createState() => _CardPreviewState();
}

class _CardPreviewState extends State<CardPreview> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 120), () {
      screenshotController.capture(pixelRatio: MediaQuery.of(context).devicePixelRatio).then((image) => _saved(image, context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Center(child: Text("معاينة البطاقة", style: Styles.textStyle16W500.copyWith(color: AppColors.blackColor),)),
          actions: [
            InkWell(
              onTap: (){
                GoRouter.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(child: Icon(Icons.arrow_forward_ios,color: Colors.grey),)),
              ),

          ],
        ),
        body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),alignment: Alignment.center,
        child: Column(
          children: [
            Screenshot(
                    controller: screenshotController,
                    child: CardPreviewWidget(subscriptionRequest: widget.subscriptionRequest)),
            DefaultButton(
              function: () {
                screenshotController.capture(pixelRatio: MediaQuery.of(context).devicePixelRatio).then((image) => _saved(image, context));
              },
              text: StringsManager.saveandshare,
              redius: 10,
            ),
          ],
        )));
  }

  _saved(Uint8List? image, BuildContext context) async {
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    CacheHelper.saveData(key: 'MemberShipCard', value: path);
    File(path).writeAsBytes(image!).then((value) => onGetPath(
      value.path,
    ));
  }

  onGetPath(String path) {
    Share.shareXFiles([XFile(path)]);
  }
}