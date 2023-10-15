import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/app_config_provider.dart';

import '../../styles/color.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(backgroundColor:provider.appTheme==ThemeMode.light? BackgroundLight:BackgroundDark,
      appBar: AppBar(
        backgroundColor: primaryColor,
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      body: Column(children: [

        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: primaryColor,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primaryColor,
          dotsColor: WhiteColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        TaskItem(),



      ],),
    );
  }
}
