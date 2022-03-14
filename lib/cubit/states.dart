abstract class TodoStates{}

class TodoInitialState extends TodoStates{}

class TodoLoadingState extends TodoStates{}

class TodoErrorState extends TodoStates{
  final String error;

  TodoErrorState(this.error);
}

class TodoSetTaskTimeState extends TodoStates{}

class TodoSetWhenColorState extends TodoStates{}

class TodoSelectedDateTimeState extends TodoStates{}

class TodoAddNewTaskState extends TodoStates{}

class TodoDeleteTaskState extends TodoStates{}

class TodoClearTaskTimeState extends TodoStates{}

class TodoGetAllTasksState extends TodoStates{}

class TodoSetScheduledTaskState extends TodoStates{}
