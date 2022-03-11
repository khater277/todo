import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/states.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context)=>BlocProvider.of(context);
  
}