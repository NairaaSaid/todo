
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/setting/setting_tab.dart';

import '../provider/app_config_provider.dart';
import '../screens/tasks/bottomSheetTask.dart';
import '../screens/tasks/task_tab.dart';
import '../styles/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homelayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor:provider.appTheme==ThemeMode.light? BackgroundLight:BackgroundDark,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: WhiteColor,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            showBottomSheet();
          },
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        color: WhiteColor,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          //backgroundColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: AppLocalizations.of(context)!.list,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: AppLocalizations.of(context)!.setting,
              )
            ]),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksTab(), SettingTab()];

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomSheetAddTask(),
        ));
  }
}
