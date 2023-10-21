import 'package:flutter/material.dart';
import 'package:todo/screens/registration/sign_up/sign_up.dart';

import '../../styles/color.dart';
import 'login/login.dart';

class Registration extends StatelessWidget {
  static const String routeName = "registration";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: BackgroundLight,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryColor,
            title: Text("ToDo App"),
            bottom: TabBar(tabs: [
              Tab(
                  icon: Icon(Icons.login, color: WhiteColor),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: WhiteColor, fontWeight: FontWeight.bold),
                  )),
              Tab(
                icon: Icon(Icons.app_registration, color: WhiteColor),
                child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: WhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ])),
        body: TabBarView(children: [
          Center(child: LoginScreen()),
          Center(child: SignUpScreen()),
        ]),
      ),
    );
  }
}
