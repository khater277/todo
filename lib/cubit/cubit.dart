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
  }


  List<TaskModel> tasks = [];
  List<List<TaskModel>> allTasks = [[],[],[]];

  void getAllTasks(){
    for (int i = 0 ; i < tasksBox!.length ; i++) {
      TaskModel task = tasksBox!.getAt(i);
      tasks.add(task);
      taskOperation(task: task, isAdd: true);
    }
    print(allTasks);
    emit(TodoGetAllTasksState());
  }

  void addNewTask({@required String? name,@required DateTime? dateTime,}){
    TaskModel task = TaskModel(
        name: name!,
        dateTime: dateTime!,
      isCompleted: false,
      isPinned: false
    );

    taskOperation(task: task, isAdd: true);
    tasksBox!.add(task);
    tasks.add(task);
    taskDateTime = null;
    emit(TodoAddNewTaskState());
  }

  void deleteTask({@required int? index,@required TaskModel? task}){

    int taskIndex = tasks.indexOf(task!);
    tasksBox!.deleteAt(taskIndex);
    tasks.remove(task);
    taskOperation(task: task, isAdd: false);
    emit(TodoDeleteTaskState());
  }

}