import 'package:flutter/material.dart';
import 'package:habittrackerapp/models/appmodels.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
import 'package:habittrackerapp/utils/routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  Hive.registerAdapter(AddHabitAdapter());
  await Hive.openBox('AddHabit');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: const MyHomePage(title: 'Habit tracker'),
      initialRoute: '/',
      routes: Routes.routes,

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Habit Tracker',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.dashboard);
              }, 
              child: const Text(
                'CLICK TO LOGIN!!!!', 
                style: TextStyle(color: Colors.black),
                ),
              )
          ],
        ),
      ),
    );
  }
}
