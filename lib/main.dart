import 'package:flutter/material.dart';

import 'api_call.dart';
import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page de connexion',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/liste': (context) => const SecondScreen(),
        
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Future<Users> users;

  @override
  void initState() {
    super.initState();
    users = Users.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:  const Text("Seance de test du "),
        centerTitle: true,
      ),
      body: Center(child: FutureBuilder<Users>(
        future: users,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data!.name),
                Text(snapshot.data!.username),
                Text(snapshot.data!.email),
                Text(snapshot.data!.birthday),
              ],
            );
          }else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return const CircularProgressIndicator();
          }
        }
        ),),
    ));
  }
}