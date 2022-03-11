import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:todo/cubit/bloc_observer.dart';
import 'package:todo/screens/home/home_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/themes.dart';
import 'package:todo/translations/translation.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  /// get device language
  final String defaultLocale = Platform.localeName.substring(0,2);
  defaultLang = defaultLocale;
  await Hive.initFlutter();
  //Hive.registerAdapter(StudentModelAdapter());
  studentBox = await Hive.openBox("students");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection:languageFun(
              ar: TextDirection.rtl,
              en: TextDirection.ltr
          ),
          child: const HomeScreen()
      ),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      translations: Translation(),
      locale: Locale(
          languageFun(ar: 'ar', en: 'en')
      ),
      fallbackLocale: const Locale('en'),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 375,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(375, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
    );
  }
}
