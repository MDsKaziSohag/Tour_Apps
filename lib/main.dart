import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_application/Constines/Langages/Localizetion.dart';
import 'package:my_application/Constines/Langages/langages.dart';
import 'package:my_application/Ui/viewsAll/mainHomePage.dart';
import 'Ui/ModelsAll/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: "web-firebase",
      options: FirebaseOptions(
    apiKey: "AIzaSyB6UgxUEhG1X7uU1TN7AMRHd6qKBSxUY-I",
    appId: "1:337877130969:web:a8ea35ed1ad561753f68c8",
    messagingSenderId: "337877130969",
    projectId: "web-firebase-79297",
  ));
  await GetStorage.init();
  runApp(MyApp());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create the initialization Future outside of `build`:

    return FutureBuilder(
      // Initialize FlutterFire:

      future: Firebase.initializeApp(
        name: "web-firebase",
        options: FirebaseOptions(
          apiKey: "AIzaSyB6UgxUEhG1X7uU1TN7AMRHd6qKBSxUY-I",
          appId: "1:337877130969:web:a8ea35ed1ad561753f68c8",
          messagingSenderId: "337877130969",
          projectId: "web-firebase-79297",
        ),
      ),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(500, 900),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Languages(),
            locale: Locale('en', 'US'),
            fallbackLocale: Locale('en', 'US'),
            title: 'Bank aplication',
            theme: AppTheme().lightTheme(context),
            darkTheme: AppTheme().darkTheme(context),
            themeMode: ThemeMode.system,
            home: HomePageOne(),
          );
        });
  }
}
