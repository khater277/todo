import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/settings/settings_items/dark_mode.dart';
import 'package:todo/screens/settings/settings_items/enable_notifications.dart';
import 'package:todo/screens/settings/settings_items/language.dart';
import 'package:todo/screens/settings/settings_items/settings_head.dart';
import 'package:todo/styles/icons_broken.dart';

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
              leading: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(IconBroken.Arrow___Left_2)
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SettingsHead(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      DarkMode(cubit: cubit,),
                      const SizedBox(height: 20,),
                      SelectLanguage(cubit: cubit),
                      const SizedBox(height: 20,),
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
