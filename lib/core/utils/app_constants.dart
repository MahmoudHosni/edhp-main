import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/login_model.dart';

String ? token;
LoginModel ? loginModel;

void openUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url)))
    await launchUrl(Uri.parse(url));
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}

final HealthyNetworkLinks =[
  "https://10101.tel/w/Hospitals",
  "https://10101.tel/w/Private-clinics-Ar",
  "https://10101.tel/w/Laboratories",
  "https://10101.tel/w/Radiological-centers",
  "https://10101.tel/w/Medical-devices",
  "https://10101.tel/w/Pharmacies",
];

final governorateItem = [
  'Cairo',
  'Alexandria',
  'Porsaid',
  'Suez',
  'Domiat',
  'Daqahlia',
  'Sharqia',
  'Qalubia',
  'Kafr Elshaikh',
  'Elgharbia',
  'Monofia',
  'Buhaira',
  'Esmailia',
  'Giza',
  'Bani Suef',
  'Fayoum',
  'Menia',
  'Matrouh',
];
final List<String> genderItems = [
  'ذكر',
  'انثى',
];
final maritalStatusItem = [
  'أعزب',
  'متزوج',
  'مطلق',
  'ارمل',
];

 showVersionDialog(context) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = StringsManager.new_version.tr();
      String message = StringsManager.update_app.tr();
      String btnLabel = StringsManager.Update_Now.tr();
      String btnLabelCancel = StringsManager.later.tr();
      return Platform.isIOS
          ?  CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text(btnLabel),
                    onPressed: () => openUrl(PLAY_STORE_URL),
                  ),
                  ElevatedButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],)
          : AlertDialog(backgroundColor: Colors.white,
                  title: Text(title),
                  content: Text(message),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text(btnLabel),
                      onPressed: () => openUrl(PLAY_STORE_URL),
                    ),
                    ElevatedButton(
                      child: Text(btnLabelCancel),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],);
    },
  );
}

final String Token = "token";
final String Name = "name";
final String Email = "email";
final String Profile = "profile";
final String AppVersion = "app_version";
final String PLAY_STORE_URL = "https://play.google.com/store/apps/details?id=com.edhp";