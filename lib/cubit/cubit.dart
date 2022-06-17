import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/notifications/notifications.dart';
import 'package:todo/screens/select_date/select_date_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context)=>BlocProvider.of(context);

  //bool isDarkMode = false;
  void changeTheme(){
    isDarkMode = !isDarkMode!;
    GetStorage().write('isDarkMode', isDarkMode!);
    emit(TodoChangeThemeState());
  }


  void disableAppNotifications(){
    disableNotifications = !disableNotifications!;
    GetStorage().write('disableNotifications', disableNotifications!);
    emit(TodoChangeThemeState());
  }


  void changeAppLanguage(String value){
    lang=value;
    GetStorage().write('lang',value)
        .then((v){
      Get.updateLocale(Locale(value));
      debugPrint(lang);
    });
    emit(TodoChangeLanguageState());
  }



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
            title: "warning".tr,
            content: "timeError".tr,
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

  int scheduleTaskIndex = 0;
  void setScheduledTask(int index){
    scheduleTaskIndex = index;
    emit(TodoSetScheduledTaskState());
  }

  int dashboardTaskIndex = 0;
  void setDashboardTask(int index){
    dashboardTaskIndex = index;
    emit(TodoSetDashboardTaskState());
  }

  void taskOperation({
  @required TaskModel? task,
  @required bool? isAdd,
}){
    DateTime taskDate =DateTime(task!.dateTime!.year,
        task.dateTime!.month,task.dateTime!.day);

    DateTime todayDate = DateTime(DateTime.now().year,
        DateTime.now().month,DateTime.now().day);

    DateTime tomorrowDate = todayDate.add(const Duration(days: 1));

    int yearDate = DateTime.now().year;
    int monthDate = DateTime.now().month;

    if(todayDate==taskDate) {
      if(isAdd==true) {
        allTasks[0].add(task);
      }else{
        allTasks[0].remove(task);
      }
    }
    else if(tomorrowDate==taskDate) {
      if(isAdd==true) {
        allTasks[1].add(task);
      }else{
        allTasks[1].remove(task);
      }
    }

    if(taskDate.year == yearDate &&
        taskDate.month == monthDate){
      if(isAdd==true) {
        allTasks[2].add(task);
      }else{
        allTasks[2].remove(task);
      }
    }

    if(task.isCompleted!){
      if(isAdd==true) {
        dashboardTasks[0].add(task);
      }else{
        dashboardTasks[0].remove(task);
      }
    }
    if(task.isPending!){
      if(isAdd==true) {
        dashboardTasks[1].add(task);
      }else{
        dashboardTasks[1].remove(task);
      }
    }


    if(task.isNotification! && task.dateTime!.isBefore(DateTime.now())){
      if(isAdd==true) {
          notificationTasks.add(task);
      }else{
        notificationTasks.remove(task);
      }
    }

    if(isAdd==false){
      tasks.remove(task);
      sortedTasks.remove(task);
      dashboardTasks[2].remove(task);
    }
  }


  List<TaskModel> notificationTasks = [];
  List<TaskModel> tasks = [];
  List<TaskModel> sortedTasks = [];
  List<List<TaskModel>> allTasks = [[],[],[]];
  List<List<TaskModel>> dashboardTasks = [[],[],[]];

  void getAllTasks(){
    tasks = [];
    notificationTasks = [];
    allTasks = [[],[],[]];
    dashboardTasks = [[],[],[]];

    sortedTasks = tasksBox!.values.toList();
    for (int i = 0 ; i < tasksBox!.length ; i++) {
      TaskModel? task = tasksBox!.getAt(i);
      tasks.add(task!);
      taskOperation(task: task, isAdd: true);
    }

    sortedTasks.sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    allTasks[0].sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    allTasks[1].sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    allTasks[2].sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    dashboardTasks[0].sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    dashboardTasks[1].sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    dashboardTasks[2] = sortedTasks;
    getNotificationTasks();
    // notificationTasks.sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    debugPrint(dashboardTasks[2].toString());
    for (var element in sortedTasks) {
      debugPrint(element.name);
    }
    emit(TodoGetAllTasksState());
  }


  void getNotificationTasks({bool? isAdd}){
    notificationTasks = [];
    for (int i = 0 ; i < tasksBox!.length ; i++) {
      TaskModel? task = tasksBox!.getAt(i);
      if(task!.isNotification! && task.dateTime!.isBefore(DateTime.now())){
        notificationTasks.add(task);
      }
    }
    notificationTasks.sort((a,b) => a.dateTime!.compareTo(b.dateTime!));
    if(isAdd==true) {
      emit(TodoGetNotificationTasksState());
    }
  }

  void addNewTask({
    required BuildContext context,
    @required String? name,
    @required DateTime? dateTime,
  }){
    TaskModel task = TaskModel(
        name: name!,
        dateTime: dateTime!,
        isCompleted: false,
        isPending: false,
      isNotification: true
    );
    taskOperation(task: task, isAdd: true);
    tasksBox!.add(task);
    tasks.add(task);

    taskDateTime = null;

    if(!disableNotifications!&&task.dateTime!.isAfter(DateTime.now())) {
      int id = (dateTime.millisecondsSinceEpoch/1000).floor();
      NotificationsHelper.zonedScheduleNotification(
          context: context,task: task,id:id);
    }
    Future.delayed(Duration(seconds: dateTime.difference(DateTime.now()).inSeconds+1))
        .then((value){
          getNotificationTasks(isAdd: true);
    });
    getAllTasks();
    // emit(TodoAddNewTaskState());
  }

  void deleteTask({required int index,required TaskModel task})async{
    // int taskIndex = tasks.indexOf(task!);
    tasksBox!.deleteAt(index);
    taskOperation(task: task, isAdd: false);
    await FlutterLocalNotificationsPlugin().cancel((task.dateTime!.millisecondsSinceEpoch/1000).floor());
    getAllTasks();
    // emit(TodoDeleteTaskState());
  }

  void removeFromNotifications({required int index,required TaskModel task}){
    int taskIndex = tasks.indexOf(task);
    TaskModel newTask = TaskModel(
        name : task.name,
        dateTime : task.dateTime,
        isCompleted : task.isCompleted,
        isPending : task.isPending,
        isNotification : false
    );
    tasksBox!.putAt(taskIndex,newTask);
    getAllTasks();
    // emit(TodoRemoveFromNotificationsState());
  }

  void addToCompleted({@required int? index,@required TaskModel? task}){
    TaskModel newTask = TaskModel(
        name: task!.name,
        dateTime: task.dateTime,
        isCompleted: true,
        isPending: task.isPending,
        isNotification: task.isNotification
    );
    tasksBox!.putAt(index!, newTask);
    getAllTasks();
    // emit(TodoAddToCompletedState());
  }

  void removeFromCompleted({@required int? index,@required TaskModel? task}){
    TaskModel newTask = TaskModel(
        name: task!.name,
        dateTime: task.dateTime,
        isCompleted: false,
        isPending: task.isPending,
        isNotification: task.isNotification
    );
    tasksBox!.putAt(index!, newTask);
    getAllTasks();
    emit(TodoRemoveFromCompletedState());
  }

  void addToPend({required int index,required TaskModel task}){
    TaskModel newTask = TaskModel(
        name: task.name,
        dateTime: task.dateTime,
        isCompleted: task.isCompleted,
        isPending: true,
        isNotification: task.isNotification
    );
    tasksBox!.putAt(index, newTask);
    getAllTasks();
    // tasks[index]=newTask;
    // emit(TodoAddToPendState());
    // getAllTasks();
  }

  void removeFromPend({@required int? index,@required TaskModel? task}){
    TaskModel newTask = TaskModel(
        name: task!.name,
        dateTime: task.dateTime,
        isCompleted: task.isCompleted,
        isPending: false,
        isNotification: task.isNotification
    );
    tasksBox!.putAt(index!, newTask);
    getAllTasks();
    // tasks[index]=newTask;
    // emit(TodoRemoveFromPendState());
  }

}