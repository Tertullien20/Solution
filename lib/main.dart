import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution/firebase_options.dart';
import 'package:solution/view/apps/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/provider/language/language_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: context.watch<LanguageProvider>().locale,
      home:  const Splash(),
    );
  }
}

