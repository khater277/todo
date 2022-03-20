
import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:todo/cubit/bloc_observer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/notifications/notifications.dart';
import 'package:todo/screens/opening/opening_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/themes.dart';
import 'package:todo/translations/translation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;


//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  tz.initializeTimeZones();
  /// get device language
  final String defaultLocale = Platform.localeName.substring(0, 2);
  defaultLang = defaultLocale;
  isDarkMode = GetStorage().read('isDarkMode')??false;
  disableNotifications = GetStorage().read('disableNotifications')??false;
  lang = GetStorage().read('lang')??(defaultLang=='ar'?'ar':'en');
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  tasksBox = await Hive.openBox('tasksBox');

  NotificationsHelper.init();

  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    NotificationsHelper.configureDidReceiveLocalNotificationSubject(context);
    NotificationsHelper.configureSelectNotificationSubject();
  }

  @override
  void dispose() {
    NotificationsHelper.didReceiveLocalNotificationSubject.close();
    NotificationsHelper.selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider(
      create: (BuildContext context) => TodoCubit()..getAllTasks(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //TodoCubit cubit = TodoCubit.get(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            home: Directionality(
                textDirection:
                    languageFun(ar: TextDirection.rtl, en: TextDirection.ltr),
                child: const OpeningScreen()),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDarkMode!?ThemeMode.dark:ThemeMode.light,
            translations: Translation(),
            locale: Locale(languageFun(ar: 'ar', en: 'en')),
            fallbackLocale: const Locale('en'),
            builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 375,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(375, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(600, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
          );
        },
      ),
    );
  }
}