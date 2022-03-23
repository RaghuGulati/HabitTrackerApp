import 'package:habittrackerapp/main.dart';
import 'package:flutter/material.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
import 'package:habittrackerapp/utils/routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      theme: dashboardTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          automaticallyImplyLeading: true,
        ),
        body:Center(
          child: GridView.count(

          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(choices.length, (index) {
            return Center(
              child: SelectCard(choice: choices[index]),
           );
          }),
        ),
      ),
      ),);}}


class Choice {  
  final String title;  
  final IconData icon;
  final String routePath;  
  const Choice({required this.title, required this.icon, required this.routePath});  
}  
  
/*List<String> options = [
    "Add New Habit",
    "Enter/Edit weight/height details",
    "BMI",
    "Progress Details",
    "Progress Chart/Graph",
    "EDIT Account Details",
  ]; 
*/

List<Choice> choices = const <Choice>[  
  Choice(title: 'Add New Habit', icon: Icons.add, routePath: Routes.addNewHabit),  
  Choice(title: 'Enter/Edit weight/height details', icon: Icons.person_pin, routePath: 'Routes.addEditDetails'),  
  Choice(title: 'BMI', icon: Icons.power, routePath: ''),  
  Choice(title: 'Progress Details', icon: Icons.auto_graph, routePath: ''),  
  Choice(title: 'Progress Chart/Graph', icon: Icons.bar_chart, routePath: ''),  
  Choice(title: 'Edit Account Details', icon: Icons.contacts, routePath: ''),  
];  
  
class SelectCard extends StatelessWidget {  
  const SelectCard({Key? key, required this.choice}) : super(key: key);  
  final Choice choice;  
  
  @override  
  Widget build(BuildContext context) {  
    return Card(
        color: Colors.lightGreenAccent,  
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(choice.routePath);
          },
          child: Center(child: Column(  
              mainAxisSize: MainAxisSize.min,  
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: <Widget>[  
                Expanded(child: Icon(choice.icon, size:50.0, color: Colors.black)),  
                Text(choice.title, style: dashboardTheme.textTheme.bodyText2),  
              ]  
          ),  
          ),
        )  
    );  
  }  
}  