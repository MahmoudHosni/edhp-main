import 'dart:io';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/NextButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:edhp/features/confirm_membership_data/widgets/CardPreviewWidget.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class CardPreview extends StatefulWidget{
  final ConfirmResponse subscriptionRequest;

  CardPreview({required this.subscriptionRequest});

  @override
  State<CardPreview> createState() => _CardPreviewState();
}

class _CardPreviewState extends State<CardPreview> {
  ScreenshotController screenshotController = ScreenshotController();
  late MemberShipsResponse memberShip;

  @override
  void initState() {
    super.initState();
    memberShip = MemberShipsResponse(MedicalCompanyID: widget.subscriptionRequest.result?.MedicalCompanyID??0, MembershipTypeID: widget.subscriptionRequest.result?.MembershipTypeID??0,
        OrganizationMembershipNumber: widget.subscriptionRequest.result?.OrganizationMembershipNumber??'', OrganizationID: widget.subscriptionRequest.result?.OrganizationID??0,
        MembershipTypeName: widget.subscriptionRequest.result?.MembershipTypeName??'', OrganizationName: widget.subscriptionRequest.result?.OrganizationName??'',
        SubscriptionStartDate: widget.subscriptionRequest.result?.SubscriptionStartDate??'', SubscriptionEndDate: widget.subscriptionRequest.result?.SubscriptionEndDate??'',
        Gender: widget.subscriptionRequest.result?.Gender??1, SubscriptionTypeID: widget.subscriptionRequest.result?.SubscriptionTypeID??0, BirthDate: widget.subscriptionRequest.result?.BirthDate??'',
        StateID: widget.subscriptionRequest.result?.StateID??0, CityID: widget.subscriptionRequest.result?.CityID ??0, MedicalCompanyName: widget.subscriptionRequest.result?.MedicalCompanyName??'',
        SubscriptionNumber:  '', TotalPrice:  widget.subscriptionRequest.result?.TotalPrice?? 0 );
    // Future.delayed(const Duration(milliseconds: 120), () {
    //   screenshotController.capture(pixelRatio: MediaQuery.of(context).devicePixelRatio).then((image) => _saved(image, context));
    // });
  }

  @override
  Widget build(BuildContext context) {

    return  ViewContainer(title: StringsManager.previewMembership,body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
            children: [
              Container(width: double.infinity,height: 400,child: MemberShipCard(memberShip: memberShip,scaler: 1.7,spaceTop: 12,),alignment: Alignment.center,),
              const SizedBox(height: 20,),

              Row(children:[
                Container(alignment: Alignment.bottomLeft,
                  child: NextButton(function: (){
                    GoRouter.of(context).push(AppRouters.kLayoutScreen);
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