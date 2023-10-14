import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/tasks/edit.dart';

import '../../provider/app_config_provider.dart';
import '../../styles/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return


      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: provider.appTheme == ThemeMode.light
                ? WhiteColor
                : BackgroundDark,
            elevation: 12,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.transparent)),
            child: Slidable(
              startActionPane: ActionPane(
                extentRatio: 0.25,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                    onPressed: (context) {},
                    backgroundColor: RedColor,
                    foregroundColor: WhiteColor,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],),
              endActionPane:
              ActionPane(extentRatio: 0.25, motion: ScrollMotion(), children: [
                SlidableAction(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topRight: Radius.circular(15)),
                  flex: 2,

                  onPressed: (context) {
                    Navigator.pushNamed(context, Edit.raouteName);
                  },
                  backgroundColor: GreenColor,
                  foregroundColor: WhiteColor,
                  icon: Icons.edit,
                  label: 'Edit',
                ),]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Container(
                    height: 80,
                    width: 4,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: primaryColor,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Task Title",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Task Description",
                          style: provider.appTheme == ThemeMode.light
                              ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)
                              : Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: WhiteColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 11),
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.done,
                        color: WhiteColor,
                      ))
                ]),
              ),
            ),
          ));
  }
}

