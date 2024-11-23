import 'package:flutter/material.dart';
// import 'package:project/pages/auth_page.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:provider/provider.dart';
import "firebase_options.dart";
import 'pages/intro.dart';
import 'services/bpm_provider.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => BpmProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elderly Care',
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('en', ''), // English
      //   const Locale('es', ''), // Spanish
      //   const Locale('ne', ''), // Nepali
      // ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      // routes: {
      //   '/checkHeartRate': (context) => CheckHeartBeatRate(),
      // },
      // home: AuthPage(),
      home: IntroductionPagesScreen(),
    );
  }
}
