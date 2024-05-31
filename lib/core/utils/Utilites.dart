import 'package:easy_localization/easy_localization.dart';

String getStartDate(){
  var now = DateTime.now();
  var formatter = DateFormat('yyyy/MM/dd');
  return formatter.format(now);
}

String getEndDate(){
  var now = DateTime.now();
  var formatter = DateFormat('yyyy/MM/dd');
  int endYear = now.year +1;
  return  "${"$endYear/${now.month}"}/${now.day}" ;
}