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

class TodoRemoveFromNotificationsState extends TodoStates{}

class TodoClearTaskTimeState extends TodoStates{}

class TodoGetAllTasksState extends TodoStates{}

class TodoGetNotificationTasksState extends TodoStates{}

class TodoSetScheduledTaskState extends TodoStates{}

class TodoSetDashboardTaskState extends TodoStates{}

class TodoAddToCompletedState extends TodoStates{}

class TodoRemoveFromCompletedState extends TodoStates{}

class TodoAddToPendState extends TodoStates{}

class TodoRemoveFromPendState extends TodoStates{}
