import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/network/firebase/firebase_manager.dart';
import '../../models/task_model.dart';
import '../../provider/app_config_provider.dart';

import '../../styles/color.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}
class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? BackgroundLight
          : BackgroundDark,
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate=date;
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: primaryColor,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primaryColor,
            dotsColor: WhiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(stream: FirebaseManager.getTask(selectedDate),
                  builder: (Context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error"));
                    }
                    var tasks =
                        snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return TaskItem( tasks[index]);
                      },
                      itemCount: tasks.length,
                    );
                  })),
        ],
      ),
    );
  }
}
