import 'package:habittrackerapp/main.dart';
import 'package:flutter/material.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
import 'package:habittrackerapp/utils/routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final Box contactBox;
  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  @override
  void initState(){
    super.initState();
    contactBox = Hive.box('AddHabit');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      theme: dashboardTheme,
      home: Scaffold(
        appBar: AppBar(
          title: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.addNewHabit);
            },
            child: Text('Click to add new habit'),
            ),
        ),
        body:Container(
          decoration: new BoxDecoration(
              color: Color(0xffffeedc),
          ),
          child: Column(
            children: [
              Container(
                width: 1000,
                padding: EdgeInsets.all(25),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Watch your actions, they become your habits.',
                              textAlign: TextAlign.left,
                              ),
                            Text('Watch your habits they become your character......'),
                          ],
                        ),
                        Image.asset('assets/images/girl.png'),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: SizedBox(
                  height: 500,
                  child: ValueListenableBuilder(
                    valueListenable: contactBox.listenable(), 
                    builder: (context, Box box, widget){
                      if (box.isEmpty){
                        return Center(
                          child: Text(' No Habit Added '),
                        );
                      }
                  
                      else{
                        return Container(
                          decoration: new BoxDecoration(
                            color: Color(0xffffeedc),
                          ),
                          child: ListView.builder(
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              var currentBox = box;
                              var Habit = currentBox.getAt(index)!;
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ListTile(
                                  title: Text(Habit.HabitName),
                                  subtitle: Text(Habit.Frequency.join(","))
                                ),
                              );
                            },
                          
                            ),
                        );
                      }
                    }
                    ),
                ),
              ),
            ],
          ),
        ),
      ),);}}


