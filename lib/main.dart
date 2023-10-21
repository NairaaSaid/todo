import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/app_config_provider.dart';
import 'package:todo/screens/tasks/edit.dart';
import 'package:todo/styles/theme.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (BuildContext context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
Edit.routeName:(context) => Edit(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.light,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.dark,
      locale: Locale(provider.appLanguage),
    );
  }
}
