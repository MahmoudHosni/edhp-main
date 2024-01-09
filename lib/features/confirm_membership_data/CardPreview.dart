import 'dart:io';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/NextButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/confirm_membership_data/widgets/CardPreviewWidget.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

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
    return  ViewContainer(title: StringsManager.previewMembership,body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
            children: [
              Screenshot(
                      controller: screenshotController,
                      child: CardPreviewWidget(subscriptionRequest: widget.subscriptionRequest)),
              const SizedBox(height: 70,),
              // DefaultButton(
              //   function: () {
              //     screenshotController.capture(pixelRatio: MediaQuery.of(context).devicePixelRatio).then((image) => _saved(image, context));
              //   },
              //   text: StringsManager.saveandshare,
              //   redius: 10,
              // ),

              Row(children:[
                Container(alignment: Alignment.bottomLeft,
                  child: NextButton(function: (){
                    screenshotController.capture(pixelRatio: MediaQuery.of(context).devicePixelRatio).then((image) => _saved(image, context));
                   }, text: 'الرئيسية' , height: 45,width: 140,),),
                const SizedBox(width: 8,),
              ],),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
    ));
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
    // Share.shareXFiles([XFile(path)]);
    GoRouter.of(context).push(AppRouters.kLayoutScreen);
  }
}