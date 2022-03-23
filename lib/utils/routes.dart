import 'package:flutter/material.dart';
import 'package:habittrackerapp/ui/addNewHabit.dart';
import 'package:habittrackerapp/ui/dashboard.dart';

class Routes{
  Routes._();

  static const String login ='/login';
  static const String register ='/register';
  static const String dashboard ='/dashboard';
  static const String addEditDetails ='/addEditDetails';
  static const String addNewHabit ='/addNewHabit';
  /*static const String dashboard ='/dashboard';
  static const String dashboard ='/dashboard';*/
  static final routes = <String, WidgetBuilder>{
    /*login: (BuildContext context) => Login(),
    register: (BuildContext context) => Register(),*/
    dashboard: (BuildContext context) => Dashboard(),
    addNewHabit: (BuildContext context) => AddNewHabit(),
  };
}