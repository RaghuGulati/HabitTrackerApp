import 'package:flutter/material.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
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
      theme: mainTheme,
      home: Scaffold(
        appBar: AppBar( 
          title: Text('Add New Habit'),
          ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Add New Habit', style: mainTheme.textTheme.bodyText2,
              ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.dashboard);
                }, 
                child: Text('Go Back to Dashboard', style: mainTheme.textTheme.bodyText2,),
                )
          ],
        ),
        ),
    );
  }
}