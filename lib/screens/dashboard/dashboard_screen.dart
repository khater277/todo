import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/dashboard/dashboard_items/dashboard_head.dart';
import 'package:todo/screens/dashboard/dashboard_items/dashboard_sidebar.dart';
import 'package:todo/screens/dashboard/dashboard_items/tasks_content.dart';
import 'package:todo/shared/default_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: const DefaultBackButton(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHead(),
              Expanded(
                child: Row(
                  children: [
                    DashboardSidebar(cubit: cubit),
                    DashboardShowTasks(cubit: cubit)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
