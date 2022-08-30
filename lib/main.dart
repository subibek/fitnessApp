import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/pages/caloriecounterpage.dart';
import 'package:project/pages/categorylistpage.dart';
import 'package:project/pages/progresstrackerpage.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDMKvXFuQxF7bfbDs7Q0jpat3T089cwB1U",
          appId: "1:663852170994:android:fb1493478366db2055da6b",
          messagingSenderId: "663852170994",
          projectId: "fitnessapp-b4ba4"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        );
      },
    );
  }
}





