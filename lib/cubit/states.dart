abstract class TodoStates{}

class TodoInitialState extends TodoStates{}

class TodoLoadingState extends TodoStates{}

class TodoErrorState extends TodoStates{
  final String error;

  TodoErrorState(this.error);
}
