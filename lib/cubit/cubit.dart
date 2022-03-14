import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/screens/select_date/select_date_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

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
      taskDateTime = dateTime.add(const Duration(days: 1));
      isToday = false;
      isTomorrow = true;
      isSelectedDate = false;
    }
    emit(TodoSetTaskTimeState());
  }

  void setWhenColor(context,int index){
    if(index==2){
      if(taskDateTime!=null) {
        currentIndex = index;
        Get.to(()=>const SelectDateScreen());
        isToday = false;
        isTomorrow = false;
        isSelectedDate = true;
      }else{
        showSnackBar(
            title: "warning",
            content: "please set time first",
            context: context,
            color: Colors.black87,
            fontColor: Colors.white,
            icon: IconBroken.Danger
        );
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

  void clearTaskTime(){
    currentIndex = 0;
    taskDateTime = null;
    emit(TodoClearTaskTimeState());
  }

  List<Box?> boxes = [todayTasks,tomorrowTasks,monthTasks];
  void addNewTask({@required String? name,@required DateTime? dateTime,}){
    TaskModel taskModel = TaskModel(
        name: name!,
        dateTime: dateTime!
    );

    DateTime todayDate = DateTime(DateTime.now().year,
        DateTime.now().month,DateTime.now().day,
        DateTime.now().hour,DateTime.now().minute,00);

    DateTime tomorrowDate = todayDate.add(const Duration(days: 1));

    int yearDate = DateTime.now().year;
    int monthDate = DateTime.now().month;

    if(todayDate==dateTime) {
      boxes[0]!.add(taskModel);
      print("DFSGGFDSDFS");
    }
    else if(tomorrowDate==dateTime) {
      boxes[1]!.add(taskModel);
    }

    if(taskModel.dateTime!.year == yearDate &&
        taskModel.dateTime!.month == monthDate){
      boxes[2]!.add(taskModel);
    }

    tasksBox!.add(taskModel);
    taskDateTime = null;
    emit(TodoAddNewTaskState());
  }

  Map<int,List<TaskModel>> allTasks = {
    0:<TaskModel>[],
    1:<TaskModel>[],
    2:<TaskModel>[],
  };

  void getAllTasks(){
    DateTime todayDate = DateTime(DateTime.now().year,
        DateTime.now().month,DateTime.now().day);

    DateTime tomorrowDate = todayDate.add(const Duration(days: 1));

    int yearDate = DateTime.now().year;
    int monthDate = DateTime.now().month;

    for (var task in tasksBox!.values) {
      DateTime taskDate = DateTime(task.dateTime!.year,
          task.dateTime!.month,task.dateTime!.day);

      if(todayDate==taskDate) {
        allTasks[0]!.add(task);
      }
      else if(tomorrowDate==taskDate) {
        allTasks[1]!.add(task);
      }

      if(task.dateTime!.year == yearDate &&
          task.dateTime!.month == monthDate){
        allTasks[2]!.add(task);
      }

    }
    print("GET TODAY TASKS DONE ${allTasks[0]!.length}");
    print("GET TOMORROW TASKS DONE ${allTasks[1]!.length}");
    print("GET MONTH TASKS DONE ${allTasks[2]!.length}");
    emit(TodoGetAllTasksState());
  }

  int scheduleTaskIndex = 0;
  void setScheduledTask(int index){
    scheduleTaskIndex = index;
    emit(TodoSetScheduledTaskState());
  }
}