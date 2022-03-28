import 'package:flutter/material.dart';
import 'package:habittrackerapp/models/appmodels.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
import 'package:habittrackerapp/utils/routes.dart';
import 'package:hive/hive.dart';

class AddNewHabit extends StatefulWidget {
  const AddNewHabit({ Key? key }) : super(key: key);

  @override
  State<AddNewHabit> createState() => _AddNewHabitState();
}

class _AddNewHabitState extends State<AddNewHabit> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      theme: dashboardTheme,
      home: Padding(
        padding: EdgeInsets.all(10),
        child: MyCustomForm(),
        ),

    );
  }


}

class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  

class MyCustomFormState extends State<MyCustomForm> {  
  late final Box box;
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form. .
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();  
  List<bool> isSwitched = [true, true, true, true, true, true, true];
  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('AddHabit');
  }


  _addInfo() async {
    // Add info to addHabit box
    //box.put('')
    AddHabit addHabit = new AddHabit(
      HabitName: _nameController.text,
      Frequency: isSwitched,
    );
  
    box.add(addHabit);

    Navigator.of(context).pushReplacementNamed(Routes.dashboard);


  }
    String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffeedc),
          elevation: 0,          
          leading: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.dashboard);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28.0,
                    color: Colors.black,
                  ),
            ),
          title: Text('Add New Habit', style: dashboardTheme.textTheme.bodyText2,),
          centerTitle: true,
        ),
        body: Container(
      padding: EdgeInsets.all(25),
      decoration: new BoxDecoration(
        color: Color(0xffffeedc),
      ),
      child: Form(  
        key: _formKey,  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
                  
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextFormField(  
                  controller: _nameController,
                  validator: _fieldValidator,
                  style: dashboardTheme.textTheme.bodyText2,
                  decoration: const InputDecoration(  
                    icon: Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: 50,
                      ),  
                    hintText: 'Enter habit name',  
                    labelText: 'Name',  
                    labelStyle: TextStyle(
                      color: Colors.brown,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                  ),  
                ),
              ),
            ), 
    
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Habit Frequency',
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          children: List.generate(daysOfWeek.length, (index) {
                            return Column(
                              children: <Widget>[
                                  Text('${daysOfWeek[index]}', style: dashboardTheme.textTheme.bodyText2,),
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Switch(
                                      value: isSwitched[index],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched[index] = value;
                                        });
                                      },
                                      activeTrackColor: Colors.orange, 
                                      activeColor: Colors.deepOrange,
                                    ),
                                  ),
                                  SizedBox(width: 250,),
                              ],
                            );
                          })
                        ),
                    ],
                    ),
                ),  
              ),
            ),
    
            Text(
              '${isSwitched}'
            ),
            
           
          ],  
        ),  
      ),
    ),

        bottomNavigationBar: BottomAppBar(
          elevation: 0,          
          child:  Card(
            child: ElevatedButton(
                      onPressed: _addInfo, 
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Submit',
                          style: dashboardTheme.textTheme.bodyText1,),
                      )
                    ),
          ),
        ),
        );  
  }  
}  

      