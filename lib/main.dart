import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_expense_tracker/backend/controllers/theme_controller.dart';
import 'package:my_expense_tracker/backend/database/database_provider.dart';
import 'package:my_expense_tracker/data/theme.dart';

import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  await DatabaseProvider.initDb();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            defaultTransition: Transition.leftToRightWithFade,
            transitionDuration: Duration(milliseconds: 800),
            title: 'My Flutter Expense Tracker',
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            themeMode: _themeController.theme,
            darkTheme: Themes.darkTheme,
            home: HomePage(),
          );
        });
  }
}
