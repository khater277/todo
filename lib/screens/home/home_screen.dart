import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/screens/add_task/add_task_screen.dart';
import 'package:todo/screens/drawer/drawer_screen.dart';
import 'package:todo/screens/main/main_screen.dart';
import 'package:todo/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        zoomDrawerController.close!();
        return false;
      },
      child: ZoomDrawer(
          controller: zoomDrawerController,
          borderRadius: 24,
          style: DrawerStyle.Style1,
          openCurve: Curves.decelerate,
          closeCurve: Curves.decelerate,
          disableGesture: false,
          mainScreenTapClose: false,
          slideWidth: MediaQuery.of(context).size.width * 0.68,
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.white,
          showShadow: true,
          angle: 0.0,
          clipMainScreen: true,
          mainScreen: const MainScreen(),
          menuScreen: const DrawerScreen()
      ),
    );
  }
}

