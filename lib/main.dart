import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(const RecipesApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      // ignore: prefer_const_constructors
      builder: (context, child) => MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: Constants().appbarsTextStyle,
                  backgroundColor: Constants.darkPurpleColor,
                  iconTheme: const IconThemeData(color: Color(0xFFFFE5E5)))),
          debugShowCheckedModeBanner: false,
          title: 'Yemek Tarifleri',
          home: const HomeScreen()),
    );
  }
}
