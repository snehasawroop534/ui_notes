import 'package:flutter/material.dart';
import 'package:ui_notes/personal_note.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme(){
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light: ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "notes App",
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        dividerColor: Colors.grey.shade400,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
              primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.white),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.grey.shade400),
          titleLarge: TextStyle(color: Colors.white),),
        dividerColor: Colors.grey.shade700,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: Colors.teal,
        ).copyWith(secondary: Colors.tealAccent),
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: PersonalNote(onToggleTheme: toggleTheme,),
    );
  }
}
