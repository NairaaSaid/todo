import 'package:flutter/material.dart';
import 'package:todo/screens/registration/sign_up/sign_up.dart';


import '../../styles/color.dart';
import 'login/login.dart';


class Registration extends StatelessWidget {
 static const String routeName ="registration";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        backgroundColor: BackgroundLight,
        appBar: AppBar(centerTitle: true,
            backgroundColor: primaryColor,
            title: Text("ToDo App"),
            bottom: TabBar(tabs: [

          Tab(icon:Icon(Icons.login) ,text:"Login",),
          Tab(icon:Icon(Icons.app_registration) ,text:"SignUp",),



        ])),
        body: TabBarView(children: [
          Center(child: LoginScreen()),

          Center(child: SignUpScreen()),
        ]),



      ),
    );
  }
}
