

class DateAnaylser{

  final String date;

  DateAnaylser({required this.date});

  String getMonth(){
    String month = date.substring(3,5);
    return month;
  }

  String getYear(){
    int centry = int.parse(date.substring(0,1));
    print('centry ::: ${centry}');
    String frYear = '';
    if(centry==1){
      frYear = '18';
    }else if(centry==2){
      frYear = '19';
    }else{
      frYear = '20';
    }
    String year = frYear+ date.substring(1,3);
    return year;
  }

  String getDay(){
    String day = date.substring(5,7);
    return day;
  }

  String getGovernorate(){
    String gov = date.substring(7,9);
    return gov;
  }

  int getGender(){
    String gender = date.substring(12,13);
    return int.parse(gender).isOdd?1:2;
  }
}