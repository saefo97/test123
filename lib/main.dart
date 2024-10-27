import 'package:flutter/material.dart';
import 'package:learnapp/provider/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'learning_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(    ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 ThemeData lightThemeData = ThemeData.light().copyWith(
  inputDecorationTheme: InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
  width: 1.5,
  color: Colors.blue.shade600, // لون الحواف عندما يكون الحقل غير مفعّل
  ),
  ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
  color: Colors.blue.shade900,
  width: 3.0,
  ),
  ),
  labelStyle: TextStyle(
  color: Colors.blue.shade900,
  ),
  ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        if (themeNotifier.isLoading) {
          print("Hello");
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(), // شاشة انتظار أثناء تحميل الثيم
              ),
            ),
          );
        }else{
          return MaterialApp(
            theme: lightThemeData,
            darkTheme: ThemeData.dark(),
            themeMode: themeNotifier.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const LearningWidget(),
          );
        }
      },
    );
  }
}
