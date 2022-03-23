import 'package:habittrackerapp/main.dart';
import 'package:habittrackerapp/ui/widgets/themes.dart';
import 'package:habittrackerapp/utils/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      theme: loginTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          automaticallyImplyLeading: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to Login Page', style: loginTheme.textTheme.bodyText2,),
                SizedBox(height: 25.0,),
                OutlinedButton(
                  
                onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                },

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Back', 
                      style: loginTheme.textTheme.bodyText2, 
                      ),
                ),
                ),
                SizedBox(height: 25.0,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.register);
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Not a member..... \nRegister Yourself First',
                      textAlign: TextAlign.center,
                      style: loginTheme.textTheme.bodyText2,
                    ),
                  )),

              ],
            ),
          ),
      ),
    );
  }
}