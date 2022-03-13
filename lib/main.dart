
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:todo/cubit/bloc_observer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/calendar/calendar_screen.dart';
import 'package:todo/screens/home/home_screen.dart';
import 'package:todo/screens/opening/opening_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/themes.dart';
import 'package:todo/translations/translation.dart';
import 'package:hive_flutter/hive_flutter.dart';
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();

  /// get device language
  final String defaultLocale = Platform.localeName.substring(0, 2);
  defaultLang = defaultLocale;
  //await Hive.initFlutter();
  //Hive.registerAdapter(StudentModelAdapter());
  //studentBox = await Hive.openBox("students");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection:
                    languageFun(ar: TextDirection.rtl, en: TextDirection.ltr),
                child: const OpeningScreen()),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
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
                const ResponsiveBreakpoint.resize(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
          );
        },
      ),
    );
  }
}
///////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//
//   runApp(
//     EasyLocalization(
//       child: MyApp(),
//       path: 'assets/langs',
//       supportedLocales: MyApp.list,
//       saveLocale: true,
//       useOnlyLangCode: true,
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   static const list = [
//     Locale('en'),
//     Locale('ar'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Zoom Drawer Demo',
//       onGenerateTitle: (context) => tr("app_name"),
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         accentColor: Colors.orange,
//       ),
//       home: ChangeNotifierProvider(
//         create: (_) => MenuProvider(),
//         child: HomeScreen(),
//       ),
//     );
//   }
//}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.dark,
//   ));
//   runApp(const MyApp());
// }
//
// const Color p = Color(0xff416d69);
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Corona Out',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           primaryColor: p,
//         ),
//         home: const Zoom());
//   }
// }
//
// final ZoomDrawerController z = ZoomDrawerController();
//
// class Zoom extends StatefulWidget {
//   const Zoom({Key? key}) : super(key: key);
//
//   @override
//   _ZoomState createState() => _ZoomState();
// }
//
// class _ZoomState extends State<Zoom> {
//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       controller: z,
//       borderRadius: 24,
//       style: DrawerStyle.Style1,
//       openCurve: Curves.fastOutSlowIn,
//       disableGesture: false,
//       mainScreenTapClose: false,
//       slideWidth: MediaQuery.of(context).size.width * 0.65,
//       duration: const Duration(milliseconds: 500),
//       backgroundColor: Colors.white,
//       showShadow: true,
//       angle: 0.0,
//       clipMainScreen: true,
//       mainScreen: const Body(),
//       menuScreen: Theme(
//         data: ThemeData.dark(),
//         child: const Scaffold(
//           backgroundColor: Colors.indigo,
//           body: Padding(
//             padding: EdgeInsets.only(left: 25),
//             child: Center(
//               child: Text(
//                 'kkkk',
//                 // style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
//   late AnimationController controller = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 100),
//     value: -1.0,
//   );
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   bool get isPanelVisible {
//     final AnimationStatus status = controller.status;
//     return status == AnimationStatus.completed ||
//         status == AnimationStatus.forward;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: IconButton(
//           onPressed: () {
//             controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
//           },
//           icon: AnimatedIcon(
//             icon: AnimatedIcons.close_menu,
//             progress: controller.view,
//           ),
//         ),
//       ),
//       body: TwoPanels(
//         controller: controller,
//       ),
//     );
//   }
// }
//
// class TwoPanels extends StatefulWidget {
//   final AnimationController controller;
//
//   const TwoPanels({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   _TwoPanelsState createState() => _TwoPanelsState();
// }
//
// class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
//   static const header_height = 32.0;
//   late TabController tabController = TabController(length: 3, vsync: this);
//
//   Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
//     final height = constraints.biggest.height;
//     final backPanelHeight = height - header_height;
//     const frontPanelHeight = -header_height;
//
//     return RelativeRectTween(
//         begin: RelativeRect.fromLTRB(
//             0.0, backPanelHeight, 0.0, frontPanelHeight),
//         end: RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0))
//         .animate(
//         CurvedAnimation(parent: widget.controller, curve: Curves.linear));
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   Widget bothPanels(BuildContext context, BoxConstraints constraints) {
//     final ThemeData theme = Theme.of(context);
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           Scaffold(
//             appBar: AppBar(
//               title: const Text("Backdrop"),
//               elevation: 0.0,
//               leading: IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   z.toggle!();
//                 },
//               ),
//               bottom: TabBar(
//                 controller: tabController,
//                 tabs: [
//                   Tab(
//                     //icon: Icon(Icons.home_filled),
//                     text: 'lll',
//                   ),
//                   Tab(
//                     icon: Icon(Icons.home_filled),
//                     //text: 'lll',
//                   ),
//                   Tab(
//                     icon: Icon(Icons.home_filled),
//                     text: 'lll',
//                   )
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               controller: tabController,
//               children: [
//                 Container(
//                   color: theme.primaryColor,
//                   child: Center(
//                     child: Text(
//                       "Back Panel",
//                       style: TextStyle(fontSize: 24.0, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.pink,
//                   child: Center(
//                     child: Text(
//                       "Back Panel",
//                       style: TextStyle(fontSize: 24.0, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.brown,
//                   child: Center(
//                     child: Text(
//                       "Back Panel",
//                       style: TextStyle(fontSize: 24.0, color: Colors.white),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           PositionedTransition(
//             rect: getPanelAnimation(constraints),
//             child: Material(
//               elevation: 12.0,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16.0),
//                   topRight: Radius.circular(16.0)),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     height: header_height,
//                     child: Center(
//                       child: Text(
//                         "Shop Here",
//                         style: Theme.of(context).textTheme.button,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text("Front Panel",
//                           style:
//                           TextStyle(fontSize: 24.0, color: Colors.black)),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: bothPanels,
//     );
//   }
// }