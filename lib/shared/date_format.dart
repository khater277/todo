import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';

class DateFormatter {

  Map<String,String> cal={
    '01':'Jan', '02':'Feb',
    '03':'Mar', '04':'Apr',
    '05':'May','06':'Jun',
    '07':'Jul','08':'Aug',
    '09':'Sep','10':'Oct',
    '11':'Nov','12':'Dec',
  };

  Map<String,String> calAr={
    '01':'يناير', '02':'فبراير',
    '03':'مارس', '04':'ابريل',
    '05':'مايو','06':'يونيو',
    '07':'يونيه','08':'اغسطس',
    '09':'سبتمبر','10':'اكتوبر',
    '11':'نوفمبر','12':'ديسمبر',
  };

  Map<String,String> period={
    '00':'12', '01':'1', '02':'2', '03':'3',
    '04':'4','05':'5', '06':'6','07':'7',
    '08':'8','09':'9', '10':'10','11':'11',
    '12':'12', '13':'1', '14':'2', '15':'3',
    '16':'4','17':'5', '18':'6','19':'7',
    '20':'8','21':'9', '22':'10','23':'11',
  };

  Map<String,String>? dateFormat(String? dateTime){
    String? day=dateTime!.substring(8,10);
    if(day[0]=='0'){
      day=day[1];
    }
    String? month=dateTime.substring(5,7);
    String? year=dateTime.substring(0,4);
    String? hour=dateTime.substring(11,13);
    String? min=dateTime.substring(14,16);
    String x="";
    if(hour.startsWith('0')||hour=="10"||hour=="11"){
      x=languageFun(ar: 'ص',en: "AM");
    }else{
      x=languageFun(ar: 'م',en: "PM");
    }
    return {
      'date':languageFun(
          ar: "$day ${calAr[month]} $year في ${period[hour]}:$min $x",
          en: "$day ${cal[month]} $year at ${period[hour]}:$min $x"
      ),
      'year':year
    };
  }

  String time(String dateTime){
    String date = dateFormat(dateTime)!['date']!;
    int atIndex = date.indexOf('at');
    int fiIndex = date.indexOf('في');
    return languageFun(
        ar: date.substring(fiIndex+3,date.length),
        en: date.substring(atIndex+3,date.length)
    );
  }

  dynamic languageFun({
    @required ar,
    @required en,
  }){
    return lang!=null?
    lang=='ar'?ar:en
        :(defaultLang=='ar'?ar:en);
  }






  String lastMessageDate(date,index){
    int lastIndex = dateFormat(date)!['date']!.
    indexOf('في')+2;
    int firstIndex = dateFormat(date)!['date']!.
    indexOf('في')-5;
    return languageFun(
        ar:dateFormat(date)!['date']!.contains('في')?
        dateFormat(date)!['date']!.
        replaceRange(firstIndex,lastIndex, ',')+checkYear(date, index)
            :dateFormat(date)!['date'],
        en: dateFormat(date)!['date']!.
        replaceRange(7, 15, ",")+checkYear(date, index)
    );
  }

  String checkYear(String date, int index){
    return (dateFormat(DateTime.now().toString())!['year']!)==
        dateFormat(date)!['year']?"":
    " ${dateFormat(date)!['year']}";
  }
}