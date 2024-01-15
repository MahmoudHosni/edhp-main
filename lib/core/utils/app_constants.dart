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