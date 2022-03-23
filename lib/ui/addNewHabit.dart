import 'package:flutter/material.dart';
import 'package:habittrackerapp/utils/routes.dart';

class AddNewHabit extends StatefulWidget {
  const AddNewHabit({ Key? key }) : super(key: key);

  @override
  State<AddNewHabit> createState() => _AddNewHabitState();
}

class _AddNewHabitState extends State<AddNewHabit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      home: Scaffold(
        appBar: AppBar( 
          title: Text('Add New Habit'),
          ),

        body: Center(
          child: Text(
            'Add New Habit'
          ),
          ),
        ),
    );
  }
}