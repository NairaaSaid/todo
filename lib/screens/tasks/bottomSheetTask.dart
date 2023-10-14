
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/color.dart';

class BottomSheetAddTask extends StatefulWidget {
  @override
  State<BottomSheetAddTask> createState() => _BottomSheetAddTaskState();
}

class _BottomSheetAddTaskState extends State<BottomSheetAddTask> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();
var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.addNewTask,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: blackColor)),
          ),
         Form(key:formkey ,
           child: Column(children: [ Padding(
             padding: const EdgeInsets.all(20.0),
             child: TextFormField(
                 validator: (text) {
                   if(text==null || text.isEmpty){
                     return "please enter task name";
                   }
                   return null;
                 },
                 controller: titleController,
                 textAlign: provider.appLanguage == "en"?TextAlign.start:TextAlign.end,
                 decoration: InputDecoration(

                   hintText: "enter your task",
                 )),
           ),
             Padding(
               padding: const EdgeInsets.only(left: 20.0),
               child: TextFormField(
                   validator: (text) {
                     if(text==null || text.isEmpty){
                       return "please enter task description";
                     }
                     return null;
                   },
                   controller: descriptionController,
                   textAlign:provider.appLanguage == "en"?TextAlign.start:TextAlign.end,
                   decoration:
                   InputDecoration(hintText: "enter your description"),maxLines: 4),
             ),],),
         ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Text("Select Time",
                textAlign: provider.appLanguage == "en"?TextAlign.start:TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: blackColor)),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              SelectDate();
            },
            child: Text(
                textAlign: TextAlign.center,
                selectedDate.toString().substring(0, 10),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, color: primaryColor)),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(onPressed: () {
            addTask();

          }, child: Text("Add Task"))
        ]);
  }

  SelectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }

  void addTask() {
if(formkey.currentState?.validate()==true){




}


  }
}
