import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/app_config_provider.dart';
import 'package:todo/screens/tasks/edit.dart';
import 'package:todo/styles/theme.dart';

import 'layout/home_layout.dart';

void main() {
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
Edit.raouteName:(context) => Edit(),

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
