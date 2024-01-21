import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution/firebase_options.dart';
import 'package:solution/services/auth_service.dart';
import 'package:solution/view/apps/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'model/user_app.dart';
import 'provider/language/language_provider.dart';
import 'utils/constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        StreamProvider.value(
            value: null, initialData: AuthenticationService().user),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //AppUserData userData = AppUserData(uid: '', name: '', userUrlImg: '');
    return StreamProvider<UserApp?>.value(
        value: AuthenticationService().user,
        initialData: null,
        child: MaterialApp(
          title:
              'The Solution Web Mobile Application Open Source Project Competition Rules and Guidelines',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primary),
            // useMaterial3: true,
          ),
          locale: context.watch<LanguageProvider>().locale,
          home: const Splash(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
