import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/settings/settings_items/dark_mode.dart';
import 'package:todo/screens/settings/settings_items/enable_notifications.dart';
import 'package:todo/screens/settings/settings_items/language.dart';
import 'package:todo/screens/settings/settings_items/settings_head.dart';
import 'package:todo/shared/default_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              leading: const DefaultBackButton(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SettingsHead(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.55.w),
                  child: Column(
                    children: [
                      DarkMode(cubit: cubit,),
                      SizedBox(height: 2.8.h,),
                      SelectLanguage(cubit: cubit),
                      SizedBox(height: 2.8.h,),
                      DisableNotifications(cubit: cubit)
                    ],
                  ),
                )
              ],
            )
        );
      },
    );
  }
}
