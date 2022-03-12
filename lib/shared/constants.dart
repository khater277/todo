import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';



const Color pink = Color(0xffFE4775);
const Color blue = Color(0xff161060);
Box? studentBox;
String? lang;
String? defaultLang;
ZoomDrawerController zoomDrawerController = ZoomDrawerController();

void printError(String? funName,String? error){
  debugPrint("error in $funName ====> $error");
}

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

//2022-02-12T12:30:00Z
String timeFormat(String time){
  String h = time.substring(11,13);
  String m = time.substring(13,16);
  int hour = int.parse(h)+2;
  String partOfDay = hour>=12?"PM":"AM";
  hour -= 12;
  return "$hour"+m+" $partOfDay";
}

dynamic languageFun({
  @required ar,
  @required en,
}){
  return lang!=null?
  lang=='ar'?ar:en
      :(defaultLang=='ar'?ar:en);
}


String formatName(String name){
  List<int> capitalLettersIndex=[];
  for(int i=0;i<name.length;i++){
    if(name[i]==" "){
      capitalLettersIndex.add(i);
    }
  }
  for(int i=0;i<capitalLettersIndex.length;i++){
    String smallLetter = name.substring(
        capitalLettersIndex[i],capitalLettersIndex[i]+2);
    String capitalLetter = smallLetter.toUpperCase();
    name = name.replaceRange(
        capitalLettersIndex[i],
        capitalLettersIndex[i]+2,
        capitalLetter
    );
  }
  String firstLetter = name[0];
  name = name.replaceFirst(firstLetter, firstLetter.toUpperCase());
  return name;
}