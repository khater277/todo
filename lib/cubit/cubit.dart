import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/select_date/select_date_screen.dart';
import 'package:todo/shared/constants.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  DateTime? taskTime;
  DateTime? taskDateTime;
  bool isToday = false;
  bool isTomorrow = false;
  bool isSelectedDate = false;
  void setTaskTime(DateTime dateTime){
    taskTime = dateTime;
    if(currentIndex==0){
      taskDateTime=dateTime;
      isToday = true;
      isTomorrow = false;
      isSelectedDate = false;
    }else if(currentIndex==1){
      taskDateTime = DateTime(dateTime.year,dateTime.month,
      dateTime.day+1,dateTime.hour,dateTime.minute,dateTime.second);
      isToday = false;
      isTomorrow = true;
      isSelectedDate = false;
    }
    Get.snackbar(taskDateTime.toString(), taskDateTime.toString());
    emit(TodoSetTaskTimeState());
  }

  void setWhenColor(int index){
    if(index==2){
      if(taskDateTime!=null) {
        currentIndex = index;
        Get.to(()=>const SelectDateScreen());
        isToday = false;
        isTomorrow = false;
        isSelectedDate = true;
      }else{
        Get.snackbar("warning", "please set time first");
      }
    }else{
      //taskDateTime = null;
      currentIndex = index;
    }
    emit(TodoSetWhenColorState());
  }

  void selectedDateTime(DateTime dateTime){
    taskDateTime = DateTime(dateTime.year,dateTime.month,dateTime.day,
    taskTime!.hour,taskTime!.minute,taskTime!.second);
    emit(TodoSelectedDateTimeState());
  }

}